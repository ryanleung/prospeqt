//
//  PMNetworkController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMNetworkController.h"
#import "PMKeychain.h"
#import "PMObjectManager.h"
#import "NSManagedObjectModel+PMDataStack.h"
#import "PMObjectManager.h"
#import "PMManagedObjectStore.h"

typedef void (^PMAFNetworkingSuccessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^PMAFNetworkingFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);
static void *pm_completionContext = &pm_completionContext;

@interface PMNetworkController()
@property (nonatomic, readonly) PMObjectManager *objectManager;
@property (nonatomic, strong) NSMutableSet *operations;
@end
//typedef void (^PMAFNetworkingSuccessBlock) (;
@implementation PMNetworkController

#pragma mark - Authentication

- (BOOL)sessionInvalid
{
    return [PMKeychain keychain].authenticationToken == nil || [PMKeychain keychain].userEmail == nil;
}

- (id)init
{
    if (self = [super init]) {
        [self updateAuthorizationHeadersIfNeeded];
        _operations = [NSMutableSet set];
    }
    return self;
}

#pragma mark - Properties

- (PMObjectManager *)objectManager
{
    return [PMObjectManager objectManager];
}

- (NSManagedObjectContext *)mainContext
{
    return self.objectManager.managedObjectStore.mainQueueManagedObjectContext;
}
                                            
- (void)authenticateIfNeededAndLoadData:(id<PMDataLoadProtocol>)dataLoader
{
    if ([dataLoader needsUserAuthentication] && [self sessionInvalid]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kPMNotificationUserNeedsAuthenticated object:dataLoader];
        });
    } else {
        [dataLoader loadData];
    }
}

- (BOOL)isCurrentUser:(PMUser *)user
{
    return [[PMKeychain keychain].userEmail isEqualToString:user.email];
}

- (NSString *)currentUserEmail
{
    return [PMKeychain keychain].userEmail;
}

- (PMUser *)currentUser
{
    if (!self.currentUserEmail) {
        return nil;
    }
    
    NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:[PMUser entityName]];
    fetch.predicate = [NSPredicate predicateWithFormat:@"email MATCHES %@", self.currentUserEmail];
    NSArray *results = [self.mainContext executeFetchRequest:fetch error:nil];
    return [results lastObject];
}

- (void)updateKeychainUserEmail:(NSString *)email
{
    [PMKeychain keychain].userEmail = email;
}

#pragma mark - Update headers

- (void)updateAuthorizationHeadersIfNeeded
{
    NSString *token = [PMKeychain keychain].authenticationToken;
    NSString *currentToken = [self.objectManager.HTTPClient defaultValueForHeader:kPMAPIAuthorizationHeaderKey];
    
    AFHTTPClient *client = self.objectManager.HTTPClient;
    if (token && (!currentToken || ![currentToken isEqualToString:token])) {
        [client setDefaultHeader:kPMAPIAuthorizationHeaderKey value:token];
    } else if (!token && currentToken) {
        [client setDefaultHeader:kPMAPIAuthorizationHeaderKey value:nil];
    }
}

- (void)forceAuthorizationReset
{
    [PMKeychain keychain].authenticationToken = nil;
    [PMKeychain keychain].userEmail = nil;
    [self updateAuthorizationHeadersIfNeeded];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kPMNotificationUserNeedsAuthenticated object:nil userInfo:nil];
}

#pragma mark - Management

- (BOOL)isReachable
{
    AFNetworkReachabilityStatus status = self.objectManager.HTTPClient.networkReachabilityStatus;
    switch (status) {
        case AFNetworkReachabilityStatusNotReachable:
            return NO;
        case AFNetworkReachabilityStatusUnknown:
        case AFNetworkReachabilityStatusReachableViaWiFi:
        case AFNetworkReachabilityStatusReachableViaWWAN:
            return YES;
    }
    return NO;
}

- (void)cancelAllOperations
{
    NSMutableSet *copyOperations = [self.operations copy];
    for (NSOperation *operation in copyOperations) {
        [self endOperation:operation];
        [operation cancel];
    }
}

#pragma mark - Operations

- (void)startOperation:(NSOperation *)operation
{
    [operation addObserver:self forKeyPath:NSStringFromSelector(@selector(isFinished)) options:0 context:pm_completionContext];
    [operation addObserver:self forKeyPath:NSStringFromSelector(@selector(isCancelled)) options:0 context:pm_completionContext];
    [self.operations addObject:operation];
    
    if ([operation isKindOfClass:[RKObjectRequestOperation class]]) {
        [self.objectManager enqueueObjectRequestOperation:(RKObjectRequestOperation *)operation];
    } else if ([operation isKindOfClass:[AFHTTPRequestOperation class]]) {
        [self.objectManager.HTTPClient enqueueHTTPRequestOperation:(AFHTTPRequestOperation *)operation];
    } else {
        NSAssert(NO, @"Invalid operation submitted");
        [self endOperation:operation];
    }
}

- (void)endOperation:(NSOperation *)operation
{
    [operation removeObserver:self forKeyPath:NSStringFromSelector(@selector(isFinished))];
    [operation removeObserver:self forKeyPath:NSStringFromSelector(@selector(isCancelled))];
    [self.operations removeObject:operation];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (   [keyPath isEqualToString:NSStringFromSelector(@selector(isFinished))]
        || [keyPath isEqualToString:NSStringFromSelector(@selector(isCancelled))]) {
        if (context == pm_completionContext) {
            [self endOperation:object];
        }
    }
}

#pragma mark - Accounts/Sessions

- (void)createUserWithAccount:(PMAccount *)account completion:(PMNetworkCompletion)completionOrNil
{
    RKObjectRequestOperation *operation = [self.objectManager appropriateObjectRequestOperationWithObject:account
                                                                                                   method:RKRequestMethodPOST
                                                                                                     path:PMURIEndpoint.registration
                                                                                               parameters:nil];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self updateKeychainWithMappingResult:mappingResult];
        [self updateAuthorizationHeadersIfNeeded];
        
        if (completionOrNil) {
            completionOrNil(mappingResult.firstObject, nil);
        }
    } failure:[self failureResponseWithCompletion:completionOrNil]];
    
    [self startOperation:operation];
}

- (void)createSessionWithAccount:(PMAccount *)account completion:(PMNetworkCompletion)completionOrNil
{
    RKObjectRequestOperation *operation = [self.objectManager appropriateObjectRequestOperationWithObject:account
                                                                                                   method:RKRequestMethodPOST
                                                                                                     path:PMURIEndpoint.sessions
                                                                                               parameters:nil];
    
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        [self updateKeychainWithMappingResult:mappingResult];
        [self updateAuthorizationHeadersIfNeeded];
        
        if (completionOrNil) {
            completionOrNil(mappingResult.firstObject, nil);
        }
    } failure:[self failureResponseWithCompletion:completionOrNil]];
    
    [self startOperation:operation];
}

- (void)destroySession:(PMSession *)session completion:(PMNetworkCompletion)completionOrNil
{
    NSParameterAssert(session);
    
    [self updateAuthorizationHeadersIfNeeded];
    
    RKObjectRequestOperation *operation = [self.objectManager appropriateObjectRequestOperationWithObject:session
                                                                                                   method:RKRequestMethodDELETE
                                                                                                     path:PMURIEndpoint.sessions
                                                                                               parameters:nil];
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (completionOrNil) {
            completionOrNil(mappingResult.firstObject, nil);
        }
        [self updateAuthorizationHeadersIfNeeded];
    } failure:[self failureResponseWithCompletion:completionOrNil]];
    
    [self startOperation:operation];
}

- (void)updateKeychainWithMappingResult:(RKMappingResult *)mappingResult
{
    [PMKeychain keychain].authenticationToken = ((PMSession *)[[mappingResult dictionary] objectForKey:[NSNull null]]).apiToken;
    [PMKeychain keychain].userEmail = ((PMUser *)[[mappingResult dictionary] objectForKey:@"data.user"]).email;
}
#pragma mark - Messages

- (void)createMessageChain:(PMMessageChain *)msgChain
                completion:(PMNetworkCompletion)completionOrNil
{
    NSParameterAssert(msgChain);
    
    PMMessage *firstMessage = (PMMessage *)msgChain.messages[0];
    NSDictionary *params = @{
                             @"inquirer_id" :   msgChain.inquirerId,
                             @"seller_id"   :   msgChain.sellerId,
                             @"listing_id"  :   msgChain.listing.listingId,
                             @"content"     :   firstMessage.content,
                             @"msg_type"    :   firstMessage.type
                             };
    RKObjectRequestOperation *operation = [self.objectManager appropriateObjectRequestOperationWithObject:nil
                                                                                                   method:RKRequestMethodPOST
                                                                                                     path:PMURIEndpoint.createMessage
                                                                                               parameters:params];
    [operation setCompletionBlockWithSuccess:[self emptySuccessResponseWithCompletion:completionOrNil]
                                     failure:[self failureResponseWithCompletion:completionOrNil]];
    
    [self startOperation:operation];
    
}

- (void)sendMessage:(PMMessage *)msg
         toMsgChain:(PMMessageChain *)msgChain
    completionOrNil:(PMNetworkCompletion)completionOrNil
{
    
}

- (void)fetchMessages:(PMUser *)currentUser
      completionOrNil:(PMNetworkCompletion)completionOrNil
{
    NSParameterAssert(currentUser);
    
    
//    RKObjectRequestOperation *operation = [self.objectManager appropriateObjectRequestOperationWithObject:currentUser method:RKRequestMethodGET path:PMURIEndpoint. parameters:<#(NSDictionary *)#>]
}

#pragma mark - RestKit Block Helpers

- (void (^)(RKObjectRequestOperation *, RKMappingResult *))emptySuccessResponseWithCompletion:(PMNetworkCompletion)completionOrNil
{
    return ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (completionOrNil) {
            completionOrNil(nil, nil);
        }
    };
}

- (void (^)(RKObjectRequestOperation *, RKMappingResult *))objectSuccessResponseWithCompletion:(PMNetworkCompletion)completionOrNil
{
    return ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (completionOrNil) {
            completionOrNil(mappingResult.firstObject, nil);
        }
    };
}

- (void (^)(RKObjectRequestOperation *, RKMappingResult *))arraySuccessResponseWithCompletion:(PMNetworkCompletion)completionOrNil
{
    return ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (completionOrNil) {
            completionOrNil(mappingResult.array, nil);
        }
    };
}

- (void (^)(RKObjectRequestOperation *, NSError *))failureResponseWithCompletion:(PMNetworkCompletion)completionOrNil
{
    return ^(RKObjectRequestOperation *operation, NSError *error) {
        NSLog(@"status from %@: %i", operation.HTTPRequestOperation.request.URL, operation.HTTPRequestOperation.response.statusCode);
        if (completionOrNil && !operation.isCancelled) {
            completionOrNil(nil, error);
        }
    };
}

@end

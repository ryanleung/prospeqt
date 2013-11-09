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


@implementation PMNetworkController

#pragma mark - Authentication

//- (BOOL)sessionInvalid
//{
//    return [LUVKeychain keychain].authenticationToken == nil || [LUVKeychain keychain].username == nil;
//}

- (void)authenticateIfNeededAndLoadData:(id<PMDataLoadProtocol>)dataLoader
{
    if ([dataLoader needsUserAuthentication]){// && [self sessionInvalid]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:kPMNotificationUserNeedsAuthenticated object:dataLoader];
        });
    } else {
        [dataLoader loadData];
    }
}

- (BOOL)isCurrentUser:(PMUser *)user
{
    return [[PMKeychain keychain].username isEqualToString:user.username];
}

- (NSString *)currentUsername
{
    return [PMKeychain keychain].username;
}

- (PMUser *)currentUser
{
    if (!self.currentUsername) {
        return nil;
    }
    
//    NSFetchRequest *fetch = [[NSFetchRequest alloc] initWithEntityName:[PMUser entityName]];
//    fetch.predicate = [NSPredicate predicateWithFormat:@"username MATCHES %@", self.currentUsername];
//    NSArray *results = [[PMObjectManager sharedPMObjectManager].managedObjectContext executeFetchRequest:fetch error:nil];
//    return [results lastObject];
}

- (void)updateKeychainUsername:(NSString *)username
{
    [PMKeychain keychain].username = username;
}
@end

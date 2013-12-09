//
//  PMNetworkController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMAPIEnvironment.h"
#import "PMDataLoadProtocol.h"

typedef void(^PMNetworkCompletion)(id response, NSError *error);

@interface PMNetworkController : NSObject

@property (readonly) NSManagedObjectContext *mainContext;
@property (readonly) NSString *currentUserid;

#pragma mark - Management

/** Identifies if the API is currently reachable */
- (BOOL)isReachable;

/** Cancel all current operations by this network controller */
- (void)cancelAllOperations;

#pragma mark - Authentication

/** Authenticate a data loader instance so that it can begin loading data
 @param dataLoader instance of a data loader that needs to display data
 @discussion Classes that implement the LUVDataLoadProtocal can use this method to launch the authentication flow.
 */
- (void)authenticateIfNeededAndLoadData:(id<PMDataLoadProtocol>)dataLoader;

/** Determines if a User is the authenticated user for this networkController
 */
- (BOOL)isCurrentUser:(PMUser *)user;

/** Returns current User model
 */
- (PMUser *)currentUser;

/** Forces the authorization information to reset
 */
- (void)forceAuthorizationReset;

/** Updates the authorization headers if they do not match the keychain values
 */
- (void)updateAuthorizationHeadersIfNeeded;

#pragma mark - Accounts/Sessions

- (void)createUserWithAccount:(PMAccount *)account completion:(PMNetworkCompletion)completionOrNil;

- (void)createSessionWithAccount:(PMAccount *)account completion:(PMNetworkCompletion)completionOrNil;

- (void)destroySession:(PMSession *)session completion:(PMNetworkCompletion)completionOrNil;

#pragma mark - Messaging

/** Create a message chain
 @param msgChain Message chain to create
 @param completionOrNil a completion handler to perform when the action is complete
 */
- (void)createMessageChain:(PMMessageChain *)msgChain
                completion:(PMNetworkCompletion)completionOrNil;

/** Send a message
 @param msg Message to send
 @param msgChain Message chain to append message to
 @param completionOrNil a completion handler to perform when the action is complete
 */
- (void)sendMessage:(PMMessage *)msg
         toMsgChain:(PMMessageChain *)msgChain
    completionOrNil:(PMNetworkCompletion)completionOrNil;

/** fetch all messages of current user
 @param currentUser The current user
 @param completionOrNil a completion handler to perform when the action is complete
 */
- (void)fetchMessages:(PMUser *)currentUser
      completionOrNil:(PMNetworkCompletion)completionOrNil;

@end

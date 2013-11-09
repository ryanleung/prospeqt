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

@interface PMNetworkController : NSObject



@property (readonly) NSManagedObjectContext *mainContext;
@property (readonly) NSString *currentUsername;

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

/** Update current username in keychain
 */
- (void)updateKeychainUsername:(NSString *)username;

@end

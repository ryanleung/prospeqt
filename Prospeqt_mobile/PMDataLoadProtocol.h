//
//  PMDataLoadProtocol.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMDataLoadProtocol <NSObject>

/** Does the view controller require authentication to perform it's tasks? Override and return YES to force authentication on the object
 @return BOOL does the view controller need authentication
 */
- (BOOL)needsUserAuthentication;

/** Endpoint to begin loading data; the reciever as needing to load data after verifying login state
 @discussion Allows the implementation to perform any setup before making requests (e.g., launch the authentication flow if the user is not logged in.)
 */
- (void)setNeedsData;

/** Performs the concrete load methed for the object implementing this method.
 @discussion this method is meant to be used with -setNeedsData. After verifying the user is authenticated, this method is invoked.
 */
- (void)loadData;

@end

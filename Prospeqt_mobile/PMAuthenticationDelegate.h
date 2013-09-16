//
//  PMAuthenticationDelegate.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMBaseViewController.h"

@protocol PMAuthenticationDelegate <NSObject>

/** Authentication did succeed
 @param viewController the view controller that performed the authentication
 */
- (void)authenticationViewControllerDidAuthenticate:(PMBaseViewController *)viewController;

/** Authentication did fail
 @param viewController the view controller that performed the authentication
 */
- (void)authenticationViewControllerDidFailToAuthenticate:(PMBaseViewController *)viewController;


@end

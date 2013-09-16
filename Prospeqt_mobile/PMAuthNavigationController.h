//
//  PMAuthNavigationController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMAuthenticationDelegate.h"

@interface PMAuthNavigationController : UINavigationController

@property (nonatomic, weak) id<PMAuthenticationDelegate> authenticationDelegate;

@end

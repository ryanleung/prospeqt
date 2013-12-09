//
//  PMEnvironment.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "UIColor+PMAppearance.h"
#import "UIFont+PMAppearance.h"
#import "UIButton+PMAppearance.h"

// Notification String Constants //

extern NSString * const kPMNotificationUserNeedsAuthenticated;
extern NSString * const kPMNotificationUserDidSignOut;
extern NSString * const kPMNotificationUserDidSignIn;

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)    ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// String Constants //

extern NSString * const kPMKeychainServiceName;
extern NSString * const kPMKeychainTokenKey;
extern NSString * const kPMKeychainUseridKey;
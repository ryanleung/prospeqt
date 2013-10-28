//
//  PMEnvironment.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMEnvironment.h"

// Notification String Constants //

NSString * const kPMNotificationUserNeedsAuthenticated = @"com.prospeqt.notification.needsAuthentication";
NSString * const kPMNotificationUserDidSignOut = @"com.prospeqt.notification.signedOut";

// String Constants //

NSString * const kPMKeychainServiceName = @"com.prospeqt.keychain";
NSString * const kPMKeychainTokenKey = @"authenticationToken";
NSString * const kPMKeychainUsernameKey = @"username";
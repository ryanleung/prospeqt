//
//  PMEnvironment.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMEnvironment.h"

// Notification String Constants //

NSString * const kPMNotificationUserNeedsAuthenticated = @"com.tapsell.notification.needsAuthentication";
NSString * const kPMNotificationUserDidSignOut = @"com.tapsell.notification.signedOut";
NSString * const kPMNotificationUserDidSignIn = @"com.tapsell.notification.signedIn";

// String Constants //

NSString * const kPMKeychainServiceName = @"com.tapsell.keychain";
NSString * const kPMKeychainTokenKey = @"authenticationToken";
NSString * const kPMKeychainUserEmailKey = @"userEmail";
//
//  PMKeychain.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/20/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMKeychain : NSObject

@property (nonatomic, copy) NSString *authenticationToken;
@property (nonatomic, copy) NSString *username;

/** There should only be one keychain for Luvocracy items, this exposes access to
 this keychain
 */
+ (instancetype)keychain;

@end

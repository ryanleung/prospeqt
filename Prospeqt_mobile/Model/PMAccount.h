//
//  PMAccount.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMObjectMappingProtocol.h"

@interface PMAccount : NSObject <PMObjectMappingProtocol>

@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *facebookAccessToken;

@end

//
//  PMAddress.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/21/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMObjectMappingProtocol.h"

@interface PMAddress : NSObject <PMObjectMappingProtocol>

@property (nonatomic, strong) NSNumber *identifier;

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *streetAddress;
@property (nonatomic, copy) NSString *extendedAddress;
@property (nonatomic, copy) NSString *locality;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, copy) NSString *postalCode;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *emailAddress;

@end

//
//  PMError.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/31/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMObjectMappingProtocol.h"

@interface PMError : NSObject <PMObjectMappingProtocol>

@property (nonatomic, strong) NSString *message;

+ (instancetype)errorFromError:(NSError *)error;
+ (NSString *)messageFromError:(NSError *)error;

@end

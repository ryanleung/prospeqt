//
//  PMError.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/31/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMError.h"
#import <RestKit/RestKit.h>

@implementation PMError

+ (RKObjectMapping *)responseMapping
{
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[PMError class]];
    [objectMapping addAttributeMappingsFromDictionary:@{ @"error" : @"message" }];
    return  objectMapping;
}

+ (instancetype)errorFromError:(NSError *)error
{
    return [[error.userInfo objectForKey:RKObjectMapperErrorObjectsKey] lastObject];
}

+ (NSString *)messageFromError:(NSError *)error
{
    PMError *customError = [self errorFromError:error];
    NSString *message = nil;
    
    if (error) {
        message = customError.message;
    } else {
        message = [error localizedDescription];
    }
    
    return message;
}

@end

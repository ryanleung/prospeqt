//
//  PMAccount.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAccount.h"
#import <RestKit/RestKit.h>

@implementation PMAccount

+ (RKObjectMapping *)requestMapping
{
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    [requestMapping addAttributeMappingsFromDictionary: @{
                                                          @"email" : @"email",
                                                          @"password" : @"password",
                                                          @"firstName" : @"first_name",
                                                          @"lastName" : @"last_name",
                                                          @"facebookAccessToken" : @"facebook_access_token"
                                                          }];
    return requestMapping;
}

@end

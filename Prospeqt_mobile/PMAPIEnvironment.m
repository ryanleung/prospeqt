//
//  PMAPIEnvironment.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAPIEnvironment.h"

NSString * const PMAPIAuthorizationHeaderKey = @"";

const struct PMAPIBaseURL PMAPIBaseURL = {
    .staging = @"",
    .production = @""
};

const struct PMHTTPMethod PMHTTPMethod = {
    .httpGet = @"GET",
    .httpPost = @"POST",
    .httpPut = @"PUT",
    .httpDelete = @"DELETE",
    .httpHead = @"HEAD"
};

const struct PMURIEndpoint PMURIEndpoint = {
    .messages = @"",
    .sendMessage = @"",
    .createMessage = @""
};
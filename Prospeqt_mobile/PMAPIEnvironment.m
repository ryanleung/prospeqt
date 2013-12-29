//
//  PMAPIEnvironment.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAPIEnvironment.h"

NSString * const kPMAPIAuthorizationHeaderKey = @"X-TapsellAPIToken";

const struct PMAPIBaseURL PMAPIBaseURL = {
    .staging = @"",
    .production = @"",
    // TODO(ryan): for now, just keep switching this URL
    // options:
    .debug = @"http://localhost:3000/api/"
//    .debug = @"https://trytapsell.herokuapp.com/api/"
};

const struct PMHTTPMethod PMHTTPMethod = {
    .httpGet = @"GET",
    .httpPost = @"POST",
    .httpPut = @"PUT",
    .httpDelete = @"DELETE",
    .httpHead = @"HEAD"
};

const struct PMURIEndpoint PMURIEndpoint = {
    .registration = @"users",
    .sessions = @"sessions",
    .messages = @"messages/fetch_by_user",
    .sendMessage = @"message/send",
    .createMessage = @"message/create",
    .postListing = @"listings",
    .fetchListings = @"listings"
};
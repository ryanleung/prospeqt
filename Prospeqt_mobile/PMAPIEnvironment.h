//
//  PMAPIEnvironment.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

extern NSString * const kPMAPIAuthorizationHeaderKey;

extern const struct PMAPIBaseURL {
    __unsafe_unretained NSString *staging;
    __unsafe_unretained NSString *production;
} PMAPIBaseURL;

extern const struct PMHTTPMethod {
    __unsafe_unretained NSString *httpGet;
    __unsafe_unretained NSString *httpPost;
    __unsafe_unretained NSString *httpPut;
    __unsafe_unretained NSString *httpDelete;
    __unsafe_unretained NSString *httpHead;
} PMHTTPMethod;

extern const struct PMURIEndpoint {
    __unsafe_unretained NSString *sessions;
    __unsafe_unretained NSString *categories;
} PMURIEndpoint;
//
//  PMAPIEnvironment.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMListing.h"
#import "PMUser.h"
#import "PMMessageChain.h"
#import "PMMessage.h"
#import "PMAddress.h"
#import "PMListing.h"
#import "PMSession.h"
#import "PMTempListing.h"
#import "PMAccount.h"
#import "PMImage.h"
#import "PMError.h"

extern NSString * const kPMAPIAuthorizationHeaderKey;

extern const struct PMAPIBaseURL {
    __unsafe_unretained NSString *staging;
    __unsafe_unretained NSString *production;
    __unsafe_unretained NSString *debug;
} PMAPIBaseURL;

extern const struct PMHTTPMethod {
    __unsafe_unretained NSString *httpGet;
    __unsafe_unretained NSString *httpPost;
    __unsafe_unretained NSString *httpPut;
    __unsafe_unretained NSString *httpDelete;
    __unsafe_unretained NSString *httpHead;
} PMHTTPMethod;

extern const struct PMURIEndpoint {
    __unsafe_unretained NSString *registration;
    __unsafe_unretained NSString *sessions;
    __unsafe_unretained NSString *messages;
    __unsafe_unretained NSString *sendMessage;
    __unsafe_unretained NSString *createMessage;
    __unsafe_unretained NSString *postListing;
    __unsafe_unretained NSString *fetchListings;
    __unsafe_unretained NSString *getProfile;
    __unsafe_unretained NSString *editProfile;
} PMURIEndpoint;
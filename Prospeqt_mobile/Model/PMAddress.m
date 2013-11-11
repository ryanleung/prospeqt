//
//  PMAddress.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/21/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddress.h"
#import <RestKit/RKObjectMapping.h>

static NSString * const kPMServerKeyIdentifier = @"id";
static NSString * const kPMServerKeyFirstName = @"first_name";
static NSString * const kPMServerKeyLastName = @"last_name";
static NSString * const kPMServerKeyStreetAddress = @"street_address";
static NSString * const kPMServerKeyExtendedAddress = @"extended_address";
static NSString * const kPMServerKeyCity = @"locality";
static NSString * const kPMServerKeyState = @"region";
static NSString * const kPMServerKeyPostalCode = @"postal_code";
static NSString * const kPMServerKeyPhone = @"phone";
static NSString * const kPMServerKeyEmail = @"email";

@implementation PMAddress

#pragma mark - PMObjectMappingProtocol

+ (RKObjectMapping *)responseMapping
{
    RKObjectMapping *responseMapping = [RKObjectMapping mappingForClass:[PMAddress class]];
    
    [responseMapping addAttributeMappingsFromDictionary:@{
                                                          kPMServerKeyIdentifier : NSStringFromSelector(@selector(identifier)),
                                                          kPMServerKeyFirstName : NSStringFromSelector(@selector(firstName)),
                                                          kPMServerKeyLastName : NSStringFromSelector(@selector(lastName)),
                                                          kPMServerKeyStreetAddress : NSStringFromSelector(@selector(streetAddress)),
                                                          kPMServerKeyExtendedAddress : NSStringFromSelector(@selector(extendedAddress)),
                                                          kPMServerKeyCity : NSStringFromSelector(@selector(city)),
                                                          kPMServerKeyState : NSStringFromSelector(@selector(state)),
                                                          kPMServerKeyPostalCode : NSStringFromSelector(@selector(postalCode)),
                                                          kPMServerKeyPhone : NSStringFromSelector(@selector(phoneNumber)),
                                                          kPMServerKeyEmail : NSStringFromSelector(@selector(emailAddress))
                                                          }];
    
    return responseMapping;
}

+ (RKObjectMapping *)requestMapping
{
    RKObjectMapping *requestMapping = [RKObjectMapping requestMapping];
    
    [requestMapping addAttributeMappingsFromDictionary:@{
                                                         NSStringFromSelector(@selector(identifier)) : kPMServerKeyIdentifier,
                                                         NSStringFromSelector(@selector(firstName)) : kPMServerKeyFirstName,
                                                         NSStringFromSelector(@selector(lastName)) : kPMServerKeyLastName,
                                                         NSStringFromSelector(@selector(streetAddress)) : kPMServerKeyStreetAddress,
                                                         NSStringFromSelector(@selector(extendedAddress)) : kPMServerKeyExtendedAddress,
                                                         NSStringFromSelector(@selector(city)) : kPMServerKeyCity,
                                                         NSStringFromSelector(@selector(state)) : kPMServerKeyState,
                                                         NSStringFromSelector(@selector(postalCode)) : kPMServerKeyPostalCode,
                                                         NSStringFromSelector(@selector(phoneNumber)) : kPMServerKeyPhone,
                                                         NSStringFromSelector(@selector(emailAddress)) : kPMServerKeyEmail
                                                         }];
    
    return requestMapping;
}


@end

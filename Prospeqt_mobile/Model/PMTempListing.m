//
//  PMTempListing.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMTempListing.h"
#import "PMAddress.h"
#import <RestKit/RestKit.h>

static NSString * const kPMServerCategory = @"category";
static NSString * const kPMServerDate = @"date";
static NSString * const kPMServerInfo = @"info";
static NSString * const kPMServerListingId = @"listing_id";
static NSString * const kPMServerPicData1 = @"pic_data_1";
static NSString * const kPMServerPicData2 = @"pic_data_2";
static NSString * const kPMServerPicData3 = @"pic_data_3";
static NSString * const kPMServerPicData4 = @"pic_data_4";
static NSString * const kPMServerPostCraigslist = @"post_craigslist";
static NSString * const kPMServerPostFreeForSale = @"post_ffs";
static NSString * const kPMServerPostFacebook = @"post_facebook";
static NSString * const kPMServerPrice = @"price";
static NSString * const kPMServerSold = @"sold";
static NSString * const kPMServerState = @"state";
static NSString * const kPMServerTitle = @"title";
static NSString * const kPMServerAddress = @"address";

@implementation PMTempListing

+ (RKObjectMapping *)requestMapping
{
    RKObjectMapping *objectMapping = [RKObjectMapping requestMapping];
    
    [objectMapping addAttributeMappingsFromDictionary:@{
                                                        NSStringFromSelector(@selector(category)) : kPMServerCategory,
                                                        NSStringFromSelector(@selector(date)) : kPMServerDate,
                                                        NSStringFromSelector(@selector(info)) : kPMServerInfo,
                                                        NSStringFromSelector(@selector(listingId)) : kPMServerListingId,
                                                        NSStringFromSelector(@selector(picData1)) : kPMServerPicData1,
                                                        NSStringFromSelector(@selector(picData2)) : kPMServerPicData2,
                                                        NSStringFromSelector(@selector(picData3)) : kPMServerPicData3,
                                                        NSStringFromSelector(@selector(picData4)) : kPMServerPicData4,
                                                        NSStringFromSelector(@selector(postCraigslist)) : kPMServerPostCraigslist,
                                                        NSStringFromSelector(@selector(postFreeForSale)) : kPMServerPostFreeForSale,
                                                        NSStringFromSelector(@selector(postFacebook)) : kPMServerPostFacebook,
                                                        NSStringFromSelector(@selector(price)) : kPMServerPrice,
                                                        NSStringFromSelector(@selector(sold)) : kPMServerSold,
                                                        NSStringFromSelector(@selector(state)) : kPMServerState,
                                                        NSStringFromSelector(@selector(title)) : kPMServerTitle}];
    
    RKRelationshipMapping *relationshipMapping1 = [RKRelationshipMapping relationshipMappingFromKeyPath:NSStringFromSelector(@selector(address))
                                                                                              toKeyPath:kPMServerAddress
                                                                                            withMapping:[PMAddress requestMapping]];
    [objectMapping addPropertyMapping:relationshipMapping1];

    return objectMapping;
}

@end

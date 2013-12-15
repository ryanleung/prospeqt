//
//  PMTempListing.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PMObjectMappingProtocol.h"

@class PMAddress;

@interface PMTempListing : NSObject <PMObjectMappingProtocol>

@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *city;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, strong) NSNumber *listingId;
@property (nonatomic, strong) NSData *picData1;
@property (nonatomic, strong) NSData *picData2;
@property (nonatomic, strong) NSData *picData3;
@property (nonatomic, strong) NSNumber *postCraigslist;
@property (nonatomic, strong) NSNumber *postFacebook;
@property (nonatomic, strong) NSNumber *postFreeForSale;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSNumber *sold;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) PMAddress *address;

@end

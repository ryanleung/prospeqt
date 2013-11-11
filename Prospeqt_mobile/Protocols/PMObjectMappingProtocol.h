//
//  PMObjectMappingProtocol.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/10/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping;

@protocol PMObjectMappingProtocol <NSObject>

@optional

/** Provides mapping information for the object as a response
 @return An instance of RKObjectMapping
 */
+ (RKObjectMapping *)responseMapping;

/** Provides mapping information for the object as a request
 @return An instance of RKObjectMapping
 */
+ (RKObjectMapping *)requestMapping;

@end

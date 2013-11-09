//
//  PMObjectManager.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/6/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@class PMManagedObjectStore;

@interface PMObjectManager : RKObjectManager

+ (PMObjectManager *)objectManager;
+ (void)setObjectManager:(PMObjectManager *)objectManager;

/** Designated initializer for building an object manager with an object store
 @param store Contains information and contexts for communicating with Core Data
 */
- (id)initWithManagedObjectStore:(PMManagedObjectStore *)store httpClient:(AFHTTPClient *)httpClient;

/** Scan the Core Data model to build object mappings based on the user info
 @param model A managed object model to scan
 @return NSDictionary of all mappings found
 */
- (NSDictionary *)mappingsFromModel:(NSManagedObjectModel *)model;

@end

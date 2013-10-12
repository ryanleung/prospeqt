//
//  NSPersistentStoreCoordinator+PMDataStack.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <CoreData/CoreData.h>

typedef void(^PMPersistentStoreErrorHandler)(NSError *error);

@interface NSPersistentStoreCoordinator (PMDataStack)

+ (NSPersistentStoreCoordinator *)pm_defaultPersistentStoreCoordinator;

+ (NSPersistentStoreCoordinator *)pm_inMemoryPersistentStoreCoordinator;

+ (void)resetPersistentStore;

@end

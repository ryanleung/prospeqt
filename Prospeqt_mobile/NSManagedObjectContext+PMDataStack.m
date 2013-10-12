//
//  NSManagedObjectContext+PMDataStack.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "NSManagedObjectContext+PMDataStack.h"
#import "NSPersistentStoreCoordinator+PMDataStack.h"

static NSManagedObjectContext *pm_defaultMainQueueManagedObjectContext = nil;
static NSManagedObjectContext *pm_defaultTestingManagedObjectContext = nil;

@implementation NSManagedObjectContext (PMDataStack)

+ (NSManagedObjectContext *)pm_backgroundContext
{
    NSManagedObjectContext *backgroundContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSConfinementConcurrencyType];
    backgroundContext.persistentStoreCoordinator = [NSPersistentStoreCoordinator pm_defaultPersistentStoreCoordinator];
    
    return backgroundContext;
}

+ (NSManagedObjectContext *)pm_managedObjectContext
{
    if (pm_defaultMainQueueManagedObjectContext) return pm_defaultMainQueueManagedObjectContext;
	
    NSPersistentStoreCoordinator *coordinator = [NSPersistentStoreCoordinator pm_defaultPersistentStoreCoordinator];
    if (coordinator) {
        pm_defaultMainQueueManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [pm_defaultMainQueueManagedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return pm_defaultMainQueueManagedObjectContext;
}

+ (NSManagedObjectContext *)pm_testingObjectContext
{
    if (pm_defaultTestingManagedObjectContext) return pm_defaultTestingManagedObjectContext;
	
    NSPersistentStoreCoordinator *coordinator = [NSPersistentStoreCoordinator pm_inMemoryPersistentStoreCoordinator];
    if (coordinator) {
        pm_defaultTestingManagedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [pm_defaultTestingManagedObjectContext setPersistentStoreCoordinator:coordinator];
    }
	
    return pm_defaultTestingManagedObjectContext;
}


@end

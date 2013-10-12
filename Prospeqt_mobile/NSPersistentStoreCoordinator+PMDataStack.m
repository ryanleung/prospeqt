//
//  NSPersistentStoreCoordinator+PMDataStack.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "NSPersistentStoreCoordinator+PMDataStack.h"
#import "PMAPIEnvironment.h"
#import "NSManagedObjectModel+PMDataStack.h"
#import "PMObjectManager.h"

static NSPersistentStoreCoordinator *pm_defaultPersistentStoreCoordinator = nil;
static NSPersistentStoreCoordinator *pm_inMemoryPersistentStoreCoordinator = nil;

@implementation NSPersistentStoreCoordinator (PMDataStack)

+ (void)attachPersistentStoreToCoordinator:(NSPersistentStoreCoordinator *)coordinator
{
    NSError *error = nil;
    NSURL *documentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentationDirectory inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [documentsDirectory URLByAppendingPathComponent:@"Prospeqt_mobile.sqlite"];
    
    NSDictionary *options = @{
                              NSMigratePersistentStoresAutomaticallyOption: @YES,
                              NSInferMappingModelAutomaticallyOption : @YES
                              };
    
    if (! [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error]) {
		
        // TODO: Handle errors instead of aborting...
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

+ (NSPersistentStoreCoordinator *)pm_defaultPersistentStoreCoordinator
{
    if (pm_defaultPersistentStoreCoordinator) return pm_defaultPersistentStoreCoordinator;
    
    pm_defaultPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[NSManagedObjectModel pm_managedObjectModel]];
    [self attachPersistentStoreToCoordinator:pm_defaultPersistentStoreCoordinator];
    
    return pm_defaultPersistentStoreCoordinator;
}

+ (NSPersistentStoreCoordinator *)luv_inMemoryPersistentStoreCoordinator
{
    if (pm_inMemoryPersistentStoreCoordinator) return pm_inMemoryPersistentStoreCoordinator;
	
    pm_inMemoryPersistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[NSManagedObjectModel pm_managedObjectModel]];
	
    NSError *error = nil;
    if (! [pm_inMemoryPersistentStoreCoordinator addPersistentStoreWithType:NSInMemoryStoreType configuration:nil URL:nil options:nil error:&error]) {
		// TODO: Properly handle error in setting up coordinator
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
	
    return pm_inMemoryPersistentStoreCoordinator;
}

+ (void)resetPersistentStore
{
    NSPersistentStoreCoordinator *storeCoordinator = [self pm_defaultPersistentStoreCoordinator];
    NSPersistentStore *store = [[storeCoordinator persistentStores] lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    
    if ([storeCoordinator removePersistentStore:store error:&error]) {
        [[NSFileManager defaultManager] removeItemAtPath:storeURL.path error:&error];
        [self attachPersistentStoreToCoordinator:pm_defaultPersistentStoreCoordinator];
    } else {
        //TODO: print error
    }
}

@end

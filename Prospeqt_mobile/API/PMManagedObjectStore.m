//
//  PMManagedObjectStore.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/8/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMManagedObjectStore.h"

static NSString * const kPMStoreName = @"Prospeqt_mobile.sqlite";

@implementation PMManagedObjectStore

-(id)initWithManagedObjectModel:(NSManagedObjectModel *)managedObjectModel
{
    self = [super initWithManagedObjectModel:managedObjectModel];
    if (self) {
        NSString *path = [RKApplicationDataDirectory() stringByAppendingPathComponent:kPMStoreName];
        
        NSError *error = nil;
        NSDictionary *options = @{
                                  NSMigratePersistentStoresAutomaticallyOption : @YES,
                                  NSInferMappingModelAutomaticallyOption : @YES,
                                  };
        
        [self addSQLitePersistentStoreAtPath:path
                      fromSeedDatabaseAtPath:nil
                           withConfiguration:nil
                                     options:options
                                       error:&error];
        
        if ([self.persistentStoreCoordinator.persistentStores count] == 0) {
            NSLog(@"[Error] Could not append a store to the persistent store coordinator: %@", [error localizedDescription]);
            
            //For any failure we remove the old store, and attempt to rebuild
            [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
            
            [self addSQLitePersistentStoreAtPath:path
                          fromSeedDatabaseAtPath:nil
                               withConfiguration:nil
                                         options:options
                                           error:&error];
        }
    }
    return self;
}

@end

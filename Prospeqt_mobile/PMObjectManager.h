//
//  PMObjectManager.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/6/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 FOR VIEWING CORE DATA STUFF, go to ~/Library/Application Support/iPhone Simulator/User/Applications/{your application GUID}/Documents/{your application name}.sqlite.
 For application GUID, type ls -t to sort by Last Modified and go to first one. Then view with sqlite3 {your application name}.sqlite.
 */
@interface PMObjectManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (void)resetPersistentStore;
- (NSURL *)applicationDocumentsDirectory;
+ (PMObjectManager *)sharedPMObjectManager;

@end

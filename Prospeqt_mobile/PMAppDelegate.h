//
//  PMAppDelegate.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

//
//  NSManagedObjectContext+PMDataStack.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (PMDataStack)

+ (NSManagedObjectContext *)pm_backgroundContext;

+ (NSManagedObjectContext *)pm_managedObjectContext;

+ (NSManagedObjectContext *)pm_testingObjectContext;

@end

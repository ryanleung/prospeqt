//
//  NSManagedObjectModel+PMDataStack.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "NSManagedObjectModel+PMDataStack.h"

static NSManagedObjectModel *pm_managedObjectModel = nil;

@implementation NSManagedObjectModel (PMDataStack)

+ (NSManagedObjectModel *)pm_managedObjectModel
{
    if (pm_managedObjectModel) return pm_managedObjectModel;
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Prospeqt_mobile" withExtension:@"momd"];
    pm_managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return pm_managedObjectModel;
}

@end

//
//  PMAPILaunchService.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/8/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAPILaunchService.h"
#import <RestKit/RestKit.h>
#import "PMAPIEnvironment.h"
#import "PMObjectManager.h"
#import "PMManagedObjectStore.h"
#import "NSManagedObjectModel+PMDataStack.h"

@implementation PMAPILaunchService

- (BOOL)isDelayable
{
    return NO;
}

- (void)launch
{
    PMManagedObjectStore *objectManagerStore = [[PMManagedObjectStore alloc] initWithManagedObjectModel:[NSManagedObjectModel pm_managedObjectModel]];
//TODO(ryan): make this available
//#if PMStaging
//    #if PMDebug
//        NSURL *url = [NSURL URLWithString:PMAPIBaseURL.debug];
//    #else
//    NSURL *url = [NSURL URLWithString:PMAPIBaseURL.staging];
//    #endif
//#elif PMPRoduction
//    NSURL *url = [NSURL URLWithString:PMAPIBaseURL.production];
//#endif
    
    NSURL *url = [NSURL URLWithString:PMAPIBaseURL.debug];
    AFHTTPClient *httpClient = [AFHTTPClient clientWithBaseURL:url];
    
    [PMObjectManager setObjectManager:[[PMObjectManager alloc] initWithManagedObjectStore:objectManagerStore httpClient:httpClient]];
    
    
}

@end

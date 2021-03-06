//
//  PMAppDelegate.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAppDelegate.h"
#import "PMWindowController.h"
#import <RestKit/RestKit.h>
#import "PMLaunchController.h"

@interface PMAppDelegate()
@property (nonatomic, strong) PMWindowController *windowController;
@end
@implementation PMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Startup launch services
    PMLaunchController *launchController = [PMLaunchController new];
    [launchController launch];
    
    // Start loading view hierarchy
    self.windowController = [PMWindowController new];
    [self.windowController.window makeKeyAndVisible];
    
    return YES;
}
@end

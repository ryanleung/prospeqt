//
//  PMLaunchController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/8/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMLaunchController.h"
#import "PMAPILaunchService.h"

@implementation PMLaunchController

- (void)launch
{
    NSArray *launchServices = @[
                                [PMAPILaunchService class],
                                ];
    
    for (Class class in launchServices) {
        id<PMLaunchService> service = [class new];
        
        if ([service isDelayable]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [service launch];
            });
        } else {
            [service launch];
        }
    }
    
}

@end

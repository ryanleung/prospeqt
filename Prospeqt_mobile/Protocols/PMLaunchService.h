//
//  PMLaunchService.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/8/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PMLaunchService <NSObject>

@required

/** This is to allow for delaying the service to prevent 
 the launch of the application from taking time spinning up too 
 many launch services.
 */
- (BOOL)isDelayable;

/** Launch the service */
- (void)launch;

@end

//
//  PMAppearance.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAppearance.h"
#import "UIColor+PMAppearance.h"
#import "UIImage+PMColor.h"
#import "UIFont+PMAppearance.h"

@implementation PMAppearance

+ (void)applyAppearance
{
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor pm_orangeColor]] forBarMetrics:UIBarMetricsDefault];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowBlurRadius = 0.0f;
    shadow.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{
       NSForegroundColorAttributeName : [UIColor whiteColor],
       NSShadowAttributeName : shadow,
       NSFontAttributeName :[UIFont pm_caeciliaRomanFontWithSize:25.0f]
       }];
    
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor pm_aquaColor]]];
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
       NSForegroundColorAttributeName : [UIColor whiteColor]
       } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
       NSForegroundColorAttributeName : [UIColor pm_grayDarkColor]
       } forState:UIControlStateSelected];
    
}

@end

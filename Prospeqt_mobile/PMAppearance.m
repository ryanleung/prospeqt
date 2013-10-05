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
    [[UINavigationBar appearance] setTitleTextAttributes:
     @{
       UITextAttributeTextColor : [UIColor whiteColor],
       UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
       UITextAttributeFont : [UIFont pm_caeciliaRomanFontWithSize:25.0f]
       }];
    
    [[UITabBar appearance] setBackgroundImage:[UIImage imageWithColor:[UIColor pm_aquaColor]]];
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
       UITextAttributeTextColor : [UIColor whiteColor],
       UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
       } forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:
     @{
       UITextAttributeTextColor : [UIColor pm_grayDarkColor],
       UITextAttributeTextShadowOffset : [NSValue valueWithUIOffset:UIOffsetMake(0.0f, 0.0f)],
       } forState:UIControlStateSelected];
    
}

@end

//
//  UIFont+PMAppearance.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "UIFont+PMAppearance.h"

@implementation UIFont (PMAppearance)

+ (UIFont *)pm_caeciliaLightFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"CaeciliaLTStd-Light" size:fontSize];
}

+ (UIFont *)pm_caeciliaRomanFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"CaeciliaLTStd-Roman" size:fontSize];
}

+ (UIFont *)pm_futuraLightFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"FuturaLight" size:fontSize];
}

+ (UIFont *)pm_futuraExtendedFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"FuturaBook" size:fontSize];
}

+ (void)printFamilyNames
{
    // for debugging purposes
    NSLog(@"%@", [UIFont familyNames]);
}

@end

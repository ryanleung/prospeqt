//
//  UIColor+PMAppearance.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "UIColor+PMAppearance.h"

@implementation UIColor (PMAppearance)

+ (UIColor *)pm_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red/255.0f
						   green:green/255.0f
							blue:blue/255.0f
						   alpha:alpha];
}
   
+ (UIColor *)pm_colorWithHex:(NSInteger)hexColor alpha:(CGFloat)alpha
{
	return [self pm_colorWithRed:((float)((hexColor & 0xFF0000) >> 16))
                            green:((float)((hexColor & 0xFF00) >> 8))
                             blue:((float)(hexColor & 0xFF))
                            alpha:alpha];
}

+ (UIColor *)pm_orangeColor
{
    return [self pm_colorWithHex:0xea7a58 alpha:1.0f];
}

+ (UIColor *)pm_orangeLightColor
{
    return [self pm_colorWithHex:0xe67c51 alpha:1.0f];
}

+ (UIColor *)pm_aquaColor
{
    return [self pm_colorWithHex:0xa7cbc9 alpha:1.0f];
}

+ (UIColor *)pm_grayDarkColor
{
    return [self pm_colorWithHex:0x57535a alpha:1.0f];
}

+ (UIColor *)pm_grayMediumColor
{
    return [self pm_colorWithHex:0xb6b1ad alpha:1.0f];
}

+ (UIColor *)pm_grayLightColor
{
    return [self pm_colorWithHex:0xf6f6f6 alpha:1.0f];
}

+ (UIColor *)pm_backgroundColor
{
    return [self pm_colorWithHex:0xf6f4f1 alpha:1.0f];
}

+ (UIColor *)pm_splashBackgroundColor
{
    return [self pm_colorWithHex:0xefedea alpha:1.0f];
}

@end

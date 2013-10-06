//
//  UIFont+PMAppearance.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (PMAppearance)

+ (UIFont *)pm_caeciliaLightFontWithSize:(CGFloat)fontSize;

+ (UIFont *)pm_caeciliaRomanFontWithSize:(CGFloat)fontSize;

+ (UIFont *)pm_futuraLightFontWithSize:(CGFloat)fontSize;

+ (UIFont *)pm_futuraExtendedFontWithSize:(CGFloat)fontSize;

+ (void)printFamilyNames;

@end

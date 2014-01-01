//
//  MBProgressHUD+PMHelper.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/31/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "MBProgressHUD+PMHelper.h"

@implementation MBProgressHUD (PMHelper)

+ (MBProgressHUD *)showHUDWithTitle:(NSString *)title view:(UIView *)view offset:(UIOffset)offset animated:(BOOL)animated
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:animated];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = title;
    hud.xOffset = offset.horizontal;
    hud.yOffset = offset.vertical;
    return hud;
}

+ (MBProgressHUD *)showHUDWithTitle:(NSString *)title view:(UIView *)view animated:(BOOL)animated
{
    return [self showHUDWithTitle:title view:view offset:UIOffsetZero animated:animated];
}

@end

//
//  MBProgressHUD+PMHelper.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 12/31/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (PMHelper)

+ (MBProgressHUD *)showHUDWithTitle:(NSString *)title view:(UIView *)view animated:(BOOL)animated;

+ (MBProgressHUD *)showHUDWithTitle:(NSString *)title view:(UIView *)view offset:(UIOffset)offset animated:(BOOL)animated;

@end

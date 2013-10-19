//
//  UIButton+PMAppearance.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/13/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMButton;

@interface UIButton (PMAppearance)

+ (PMButton *)pm_postedDateButton;
+ (PMButton *)pm_editButton;
+ (PMButton *)pm_deleteButton;

- (void)applyPostedDateButton;
- (void)applyEditButton;
- (void)applyDeleteButton;

@end

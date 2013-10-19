//
//  UIButton+PMAppearance.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/13/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "UIButton+PMAppearance.h"
#import "PMButton.h"
#import "UIFont+PMAppearance.h"
#import "UIColor+PMAppearance.h"

@implementation UIButton (PMAppearance)

- (void)applyPostedDateButton
{
    self.titleLabel.font = [UIFont pm_futuraLightFontWithSize:15.0f];
    self.titleLabel.textColor = [UIColor pm_grayMediumColor];
}

- (void)applyDeleteButton
{
    
    [self setImage:[UIImage imageNamed:@"TrashCanDoodle"] forState:UIControlStateNormal];
    [self setTitle:NSLocalizedString(@"button.delete", @"delete") forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 12.0f, 0.0f, 0.0f)];
    [self setTitleColor:[UIColor pm_grayDarkColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont pm_futuraLightFontWithSize:15.0];
}

- (void)applyEditButton
{
    [self setImage:[UIImage imageNamed:@"PencilDoodle"] forState:UIControlStateNormal];
    [self setTitle:NSLocalizedString(@"button.edit", @"edit") forState:UIControlStateNormal];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 12.0f, 0.0f, 0.0f)];
    [self setTitleColor:[UIColor pm_grayDarkColor] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont pm_futuraLightFontWithSize:15.0];
}

+ (PMButton *)pm_postedDateButton
{
    PMButton *dateButton = [PMButton buttonWithType:UIButtonTypeCustom];
    [dateButton applyPostedDateButton];
    return dateButton;
}

+ (PMButton *)pm_editButton
{
    PMButton *editButton = [PMButton buttonWithType:UIButtonTypeCustom];
    [editButton applyEditButton];
    return editButton;
}

+ (PMButton *)pm_deleteButton
{
    PMButton *deleteButton = [PMButton buttonWithType:UIButtonTypeCustom];
    [deleteButton applyDeleteButton];
    return deleteButton;
}

@end

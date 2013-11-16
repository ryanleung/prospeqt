//
//  PMManageListingBoxView.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/13/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMButton, PMAccessoryLabelView;

@interface PMManageListingBoxView : UIView

@property (nonatomic, strong) UILabel *postedDateLabel;
@property (nonatomic, strong) PMButton *editButton;
@property (nonatomic, strong) PMButton *deleteButton;
@property (nonatomic, strong) UIImageView *productImageView;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) PMAccessoryLabelView *accessoryLabelView;

@end

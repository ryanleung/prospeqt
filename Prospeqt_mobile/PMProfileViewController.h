//
//  PMProfileViewController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMBaseViewController.h"

@class PMAddress;

@interface PMProfileViewController : PMBaseViewController

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UITextView *descriptionView;

@property (nonatomic, strong) PMAddress *address;

@property (nonatomic, assign) int percentPositiveReviews;

@end

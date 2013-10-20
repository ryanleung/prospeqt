//
//  PMSitePostCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMSitePostCell.h"
#import "PMButton.h"

@implementation PMSitePostCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        PMButton *postButton = [PMButton pm_postButton];
        postButton.translatesAutoresizingMaskIntoConstraints = NO;
        [postButton addTarget:self action:@selector(didPressPostButton:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:postButton];
        self.postButton = postButton;
        
        self.textLabel.font = [UIFont pm_futuraLightFontWithSize:22.0f];
        self.textLabel.textColor = [UIColor pm_grayDarkColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(postButton);
        NSDictionary *metrics = @{ @"rightSpacer" : @0, @"buttonWidth" : @100};
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[postButton(==buttonWidth)]-rightSpacer-|" options:0 metrics:metrics views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[postButton(==buttonWidth)]" options:0 metrics:metrics views:views]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:postButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)didPressPostButton:(id)sender
{
    [self.postButton setSelected:!self.postButton.selected];
    if ([self.delegate respondsToSelector:@selector(postSiteCellDidTapFollowButton:)]) {
        [self.delegate postSiteCellDidTapFollowButton:self];
    }
}

@end

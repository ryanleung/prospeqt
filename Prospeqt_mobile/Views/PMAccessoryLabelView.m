//
//  PMAccessoryLabelView.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/27/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAccessoryLabelView.h"

@implementation PMAccessoryLabelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        UIImageView *accessoryImage = [UIImageView new];
        accessoryImage.contentMode = UIViewContentModeScaleAspectFit;
        accessoryImage.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:accessoryImage];
        self.accessoryImage = accessoryImage;
        
        UILabel *textLabel = [UILabel new];
        textLabel.translatesAutoresizingMaskIntoConstraints = NO;
        textLabel.textColor = [UIColor pm_grayDarkColor];
        textLabel.font = [UIFont pm_futuraLightFontWithSize:15.0];
        [self addSubview:textLabel];
        self.textLabel = textLabel;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_accessoryImage, _textLabel);
        NSDictionary *metrics = @{ @"spacer" : @10 };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_accessoryImage]-spacer-[_textLabel]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_accessoryImage]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_textLabel]|" options:0 metrics:metrics views:views]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_accessoryImage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_accessoryImage attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    }
    return self;
}

@end

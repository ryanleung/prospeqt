//
//  PMEmptyMessagesView.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMEmptyMessagesView.h"

@interface PMEmptyMessagesView()
@property (nonatomic, strong) UILabel *placeholderLabel;
@end

@implementation PMEmptyMessagesView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor pm_backgroundColor];
        
        // TODO(ryan):eventually have the png show here
        // that has the arrow pointing down to the post listings
        // button.
        
        UILabel *placeholderLabel = [UILabel new];
        placeholderLabel.text = NSLocalizedString(@"messages.empty.text", @"empty text");
        placeholderLabel.translatesAutoresizingMaskIntoConstraints = NO;
        placeholderLabel.lineBreakMode = NSLineBreakByWordWrapping;
        placeholderLabel.numberOfLines = 4;
        placeholderLabel.font = [UIFont pm_futuraLightFontWithSize:20.0f];
        placeholderLabel.textColor = [UIColor pm_grayMediumColor];
        placeholderLabel.backgroundColor = [UIColor clearColor];
        placeholderLabel.opaque = NO;
        placeholderLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:placeholderLabel];
        self.placeholderLabel = placeholderLabel;
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:placeholderLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:placeholderLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:placeholderLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeWidth multiplier:1.0f constant:-20.0f]];
        
        [self.placeholderLabel sizeToFit];
    }
    return self;
}

@end

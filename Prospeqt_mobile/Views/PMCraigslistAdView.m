//
//  PMCraigslistAdView.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMCraigslistAdView.h"

@implementation PMCraigslistAdView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UILabel *descriptionLabel = [UILabel new];
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        descriptionLabel.font = [UIFont pm_futuraLightFontWithSize:20.0f];
        descriptionLabel.textColor = [UIColor pm_grayDarkColor];
        descriptionLabel.text = NSLocalizedString(@"done.description", @"description");
        descriptionLabel.textAlignment = NSTextAlignmentCenter;
        descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        descriptionLabel.numberOfLines = 5;
        [self addSubview:descriptionLabel];
        
        UIView *topSeparatorView = [self createSeparatorView];
        UIView *bottomSeparatorView = [self createSeparatorView];
        [self addSubview:topSeparatorView];
        [self addSubview:bottomSeparatorView];
        
        UIImageView *craigImageView = [UIImageView new];
        craigImageView.image = [UIImage imageNamed:@"Phone_withPeaceSign_Doodle"];
        craigImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:craigImageView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(descriptionLabel, topSeparatorView, bottomSeparatorView, craigImageView);
        NSDictionary *metrics = @{@"spacer": @30, @"textSpacer": @30, @"imageSpacer": @75 };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topSeparatorView]-spacer-[craigImageView]-spacer-[descriptionLabel]-spacer-[bottomSeparatorView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-textSpacer-[descriptionLabel]-textSpacer-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-imageSpacer-[craigImageView]-imageSpacer-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topSeparatorView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomSeparatorView]|" options:0 metrics:metrics views:views]];
    }
    return self;
}

- (UIView *)createSeparatorView
{
    UIView *separatorView = [UIView new];
    separatorView.translatesAutoresizingMaskIntoConstraints = NO;
    separatorView.layer.zPosition = CGFLOAT_MAX;
    separatorView.backgroundColor = [UIColor pm_grayDarkColor];
    NSDictionary *views = NSDictionaryOfVariableBindings(separatorView);
    [separatorView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[separatorView(==0.5)]" options:0 metrics:nil views:views]];
    return separatorView;
}

@end

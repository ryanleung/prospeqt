//
//  PMManageListingBoxView.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/13/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMManageListingBoxView.h"
#import "PMButton.h"
#import "UIButton+PMAppearance.h"
#import "UIColor+PMAppearance.h"
#import "PMAccessoryLabelView.h"

@implementation PMManageListingBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *topSeparatorView = [self createSeparatorView];
        UIView *bottomSeparatorView = [self createSeparatorView];
        UIView *leftSeparatorView = [self createSeparatorView];
        UIView *rightSeparatorView = [self createSeparatorView];
        [self addSubview:topSeparatorView];
        [self addSubview:bottomSeparatorView];
        [self addSubview:leftSeparatorView];
        [self addSubview:rightSeparatorView];
        
        UILabel *dateLabel = [UILabel new];
        dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        dateLabel.textAlignment = NSTextAlignmentCenter;
        dateLabel.font = [UIFont pm_futuraLightFontWithSize:14.0f];
        dateLabel.textColor = [UIColor pm_grayMediumColor];
        [self addSubview:dateLabel];
        self.postedDateLabel = dateLabel;
        
        PMButton *editButton = [PMButton pm_editButton];
        editButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:editButton];
        self.editButton = editButton;
        
        PMButton *deleteButton = [PMButton pm_deleteButton];
        deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:deleteButton];
        self.deleteButton = deleteButton;
        
        UILabel *descriptionLabel = [UILabel new];
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
        descriptionLabel.textColor = [UIColor pm_grayMediumColor];
        descriptionLabel.font = [UIFont pm_futuraLightFontWithSize:18.0f];
        descriptionLabel.lineBreakMode = NSLineBreakByWordWrapping;
        descriptionLabel.numberOfLines = 0;
        [self addSubview:descriptionLabel];
        self.descriptionLabel = descriptionLabel;
        
        UIImageView *productImageView = [UIImageView new];
        productImageView.contentMode = UIViewContentModeScaleAspectFit;
        productImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:productImageView];
        self.productImageView = productImageView;
        
        PMAccessoryLabelView *accessoryView = [PMAccessoryLabelView new];
        accessoryView.textLabel.text = @"FOR SALE";
        accessoryView.translatesAutoresizingMaskIntoConstraints = NO;
        accessoryView.accessoryImage.image = [UIImage imageNamed:@"GreenCheckmarkDoodle"];
        [self addSubview:accessoryView];
        self.accessoryLabelView = accessoryView;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(dateLabel, editButton, deleteButton, topSeparatorView, bottomSeparatorView, leftSeparatorView, rightSeparatorView, descriptionLabel, productImageView, accessoryView);
        NSDictionary *metrics = @{ @"buttonWidth": @106, @"buttonHeight": @30, @"spacer": @25, @"smallSpacer": @2, @"imageHeight": @200 };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[dateLabel(==buttonWidth)][leftSeparatorView(==0.5)][editButton(==dateLabel)][rightSeparatorView(==0.5)][deleteButton(==dateLabel)]|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topSeparatorView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[bottomSeparatorView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[rightSeparatorView(==buttonHeight)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topSeparatorView(==0.5)][leftSeparatorView(==buttonHeight)][bottomSeparatorView(==0.5)]-spacer-[productImageView(==imageHeight)]-smallSpacer-[descriptionLabel]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-smallSpacer-[productImageView(==imageHeight)]-smallSpacer-[accessoryView]|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[dateLabel(==buttonHeight)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[editButton(==buttonHeight)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[deleteButton(==buttonHeight)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-spacer-[descriptionLabel]-spacer-|" options:0 metrics:metrics views:views]];
        
    }
    return self;
}

- (UIView *)createSeparatorView
{
    UIView *separatorView = [UIView new];
    separatorView.translatesAutoresizingMaskIntoConstraints = NO;
    separatorView.layer.zPosition = CGFLOAT_MAX;
    separatorView.backgroundColor = [UIColor pm_grayMediumColor];
    return separatorView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

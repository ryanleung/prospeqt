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

@implementation PMManageListingBoxView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *separatorView = [UIView new];
        separatorView.translatesAutoresizingMaskIntoConstraints = NO;
        separatorView.layer.zPosition = CGFLOAT_MAX;
        [self addSubview:separatorView];
        separatorView.backgroundColor = [UIColor pm_grayMediumColor];
        
        PMButton *dateButton = [PMButton pm_postedDateButton];
        dateButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:dateButton];
        self.postedDateButton = dateButton;
        
        PMButton *editButton = [PMButton pm_editButton];
        editButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:editButton];
        self.editButton = editButton;
        
        PMButton *deleteButton = [PMButton pm_deleteButton];
        deleteButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:deleteButton];
        self.deleteButton = deleteButton;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(dateButton, editButton, deleteButton, separatorView);
        NSDictionary *metrics = @{ @"buttonWidth": @106, @"buttonHeight": @30 };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[dateButton(==buttonWidth)][editButton(==dateButton)][deleteButton(==dateButton)]|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[separatorView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[separatorView(==0.5)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[dateButton(==buttonHeight)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[editButton(==buttonHeight)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[deleteButton(==buttonHeight)]" options:0 metrics:metrics views:views]];
        
        
    }
    return self;
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

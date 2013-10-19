//
//  PMFormField.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/16/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMFormField.h"
#import "UIColor+PMAppearance.h"

@interface PMFormField()
@property (nonatomic, weak) NSLayoutConstraint *bottomBarConstraint;
@end

@implementation PMFormField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIView *rightBorderView = [UIView new];
        rightBorderView.translatesAutoresizingMaskIntoConstraints = NO;
        rightBorderView.backgroundColor = [UIColor pm_grayLightColor];
        rightBorderView.hidden = YES;
        [self addSubview:rightBorderView];
        self.rightBorderView = rightBorderView;
        
        UIView *topBorderView = [UIView new];
        topBorderView.translatesAutoresizingMaskIntoConstraints = NO;
        topBorderView.backgroundColor = [UIColor pm_grayLightColor];
        [self addSubview:topBorderView];
        self.topBorderView = topBorderView;
        
        UIView *bottomBorderView = [UIView new];
        bottomBorderView.translatesAutoresizingMaskIntoConstraints = NO;
        bottomBorderView.backgroundColor = [UIColor pm_grayLightColor];
        [self addSubview:bottomBorderView];
        self.bottomBorderView = bottomBorderView;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(rightBorderView, topBorderView, bottomBorderView);
        NSDictionary *metrics = @{ @"borderWidth" : @0.5, @"borderHeight" : @0.5f };
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rightBorderView]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[rightBorderView(==borderWidth@1000)]|" options:0 metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[topBorderView(==borderHeight@1000)]" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[topBorderView]|" options:0 metrics:metrics views:views]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bottomBorderView(==borderHeight@1000)]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[bottomBorderView]|" options:0 metrics:metrics views:views]];
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:bottomBorderView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f];
        self.bottomBarConstraint = constraint;
        [self addConstraint:constraint];
    }
    return self;
}

- (void)setBottomBarViewInset:(CGFloat)bottomBarViewInset
{
    self.bottomBarConstraint.constant = bottomBarViewInset;
}

- (CGFloat)bottomBarViewInset
{
    return self.bottomBarConstraint.constant;
}

- (void)setInputView:(UIView *)inputView
{
    [self insertSubview:inputView atIndex:0];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(inputView);
    NSDictionary *metrics = @{ @"spacer" : @15.0f };
    
    inputView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-spacer-[inputView]-spacer-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[inputView]|" options:0 metrics:metrics views:views]];
    
    [self setNeedsUpdateConstraints];
    
    _inputView = inputView;
}

- (BOOL)becomeFirstResponder
{
    [super becomeFirstResponder];
    return [self.inputView becomeFirstResponder];
}

- (BOOL)resignFirstResponder
{
    [super resignFirstResponder];
    return [self.inputView resignFirstResponder];
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(0.0f, 44.0f);
}

@end

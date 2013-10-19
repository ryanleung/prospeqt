//
//  PMFormBaseViewController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMBaseViewController.h"
#import "PMFormField.h"

static const CGFloat kPMBottomBarInset = 15.0f;

@interface PMFormBaseViewController : PMBaseViewController
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UIView *contentView;
@property (nonatomic, strong) NSArray *formFields;
@property (nonatomic, strong) UIView *activeField;

/**
 Submits the form, should be overriden by subclass
 */
- (void)formAction;

/**
 cancels editing of the current field
 */
- (void)cancelField;

/**
 @discussion checks all fields added to formFields and verifies if they are not empty if required
 */
- (BOOL)validateFieldsWithError:(NSError *__autoreleasing *)error;

- (void)bindLeftEdgeOfView:(UIView *)view toView:(UIView *)toView;
- (void)bindRightEdgeOfView:(UIView *)view toView:(UIView *)toView;

- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;

@end

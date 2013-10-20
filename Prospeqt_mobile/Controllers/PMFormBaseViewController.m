//
//  PMFormBaseViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMFormBaseViewController.h"

@interface PMFormBaseViewController ()

@end

@implementation PMFormBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.save", @"Save button") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    scrollView.scrollEnabled = YES;
    scrollView.alwaysBounceVertical = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    UIView *contentView = [UIView new];
    [self.scrollView addSubview:contentView];
    self.contentView = contentView;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(scrollView);
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[scrollView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[scrollView]|" options:0 metrics:nil views:views]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.activeField resignFirstResponder];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dismissKeyboard
{
    [self cancelField];
}

#pragma mark LUVFormFieldDelegate

- (void)formFieldDidBeginEditing:(PMFormField *)formField
{
    self.activeField = formField;
}

- (void)formFieldDidEndEditing:(PMFormField *)formField
{
    //TODO
}

-(void)formFieldDidChangeValue:(PMFormField *)formField
{
    //TODO
}

- (void)formFieldDidMoveNext:(PMFormField *)formField
{
    int currentFieldIndex = [self.formFields indexOfObject:formField];
    
    if (currentFieldIndex + 1 == self.formFields.count) {
        [self.formFields[0] becomeFirstResponder];
        [self formAction];
    } else {
        [self.formFields[currentFieldIndex + 1] becomeFirstResponder];
    }
}

- (void)cancelField
{
    [self.activeField resignFirstResponder];
}

- (void)formAction
{
    //Intentionally left blank, override in subclass
}

- (BOOL)validateSingleLineFieldsWithError:(NSError **)error
{
    BOOL isValid = YES;
    for (PMSingleLineFormField *formField in self.formFields){
        if ([formField respondsToSelector:@selector(required)]) {
            if (formField.required && formField.textField.text.length == 0) {
                isValid = NO;
            }
        }
    }
    
//    if (!isValid && error != NULL) {
//        *error = [NSError errorWithDomain:kPMErrorDomain code:LUVValidationError userInfo:@{@"validation_errors": NSLocalizedString(@"validation.requiredFields.error", "Default required fields error")}];
//    }
    
    return isValid;
    
    return YES;
}

- (void)bindLeftEdgeOfView:(UIView *)view toView:(UIView *)toView
{
    [toView addConstraint:[NSLayoutConstraint constraintWithItem:toView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
}

- (void)bindRightEdgeOfView:(UIView *)view toView:(UIView *)toView
{
    [toView addConstraint:[NSLayoutConstraint constraintWithItem:toView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
}

#pragma mark Keyboard methods

- (void)keyboardWillShow:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSNumber *duration = [[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    [UIView animateWithDuration:[duration floatValue] animations:^{
        self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top, self.scrollView.contentInset.left, keyboardRect.size.height, self.scrollView.contentInset.right);
        self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset;
    } completion:^(BOOL finished) {
        //iOS 7 will automatically scroll the textField into view
        if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
            [self.scrollView scrollRectToVisible:self.activeField.frame animated:YES];
        }
    }];
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    CGRect keyboardRect = [[[notification userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    NSNumber *duration = [[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    
    [UIView animateWithDuration:[duration floatValue] animations:^{
        self.scrollView.contentInset = UIEdgeInsetsMake(self.scrollView.contentInset.top, self.scrollView.contentInset.left, self.scrollView.contentInset.bottom - keyboardRect.size.height, self.scrollView.contentInset.right);
        self.scrollView.scrollIndicatorInsets = self.scrollView.contentInset;
    }];
}

@end


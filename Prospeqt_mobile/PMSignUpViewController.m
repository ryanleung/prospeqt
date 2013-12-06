//
//  PMSignUpViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMSignUpViewController.h"

@interface PMSignUpViewController ()
@property (nonatomic, strong) PMSingleLineFormField *firstNameField;
@property (nonatomic, strong) PMSingleLineFormField *lastNameField;
@property (nonatomic, strong) PMSingleLineFormField *userNameField;
@property (nonatomic, strong) PMSingleLineFormField *emailField;
@property (nonatomic, strong) PMSingleLineFormField *passwordField;
@property (nonatomic, strong) PMSingleLineFormField *confirmPasswordField;
@end

@implementation PMSignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"auth.signup", @"Title of sign up view");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"auth.signup", @"Sign in button title") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];

    PMSingleLineFormField *firstNameField = [PMSingleLineFormField new];
    firstNameField.rightBorderView.hidden = NO;
    firstNameField.translatesAutoresizingMaskIntoConstraints = NO;
    firstNameField.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    firstNameField.textField.placeholder = NSLocalizedString(@"signUpView.firstNamePlaceholder", @"Place holder text for first name field");
    firstNameField.delegate = self;
    [self.scrollView addSubview:firstNameField];
    self.firstNameField = firstNameField;
    self.firstNameField.required = YES;
    
    PMSingleLineFormField *lastNameField = [PMSingleLineFormField new];
    lastNameField.translatesAutoresizingMaskIntoConstraints = NO;
    lastNameField.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    lastNameField.textField.placeholder = NSLocalizedString(@"signUpView.lastNamePlaceholder", @"Place holder text for last name field");
    lastNameField.delegate = self;
    [self.scrollView addSubview:lastNameField];
    self.lastNameField = lastNameField;
    self.lastNameField.required = YES;
    
    PMSingleLineFormField *userNameField = [PMSingleLineFormField new];
    userNameField.topBorderView.hidden = YES;
    userNameField.translatesAutoresizingMaskIntoConstraints = NO;
    userNameField.textField.placeholder = NSLocalizedString(@"signUpView.userNamePlaceholder", @"Place holder text for username field");
    userNameField.delegate = self;
    [self.scrollView addSubview:userNameField];
    self.userNameField = userNameField;
    self.userNameField.required = YES;
    
    PMSingleLineFormField *emailField = [PMSingleLineFormField new];
    emailField.topBorderView.hidden = YES;
    emailField.translatesAutoresizingMaskIntoConstraints = NO;
    emailField.textField.placeholder = NSLocalizedString(@"signUpView.emailPlaceholder", @"Place holder text for email field");
    emailField.delegate = self;
    [self.scrollView addSubview:emailField];
    self.emailField = emailField;
    self.emailField.required = YES;
    
    PMSingleLineFormField *passwordField = [PMSingleLineFormField new];
    passwordField.topBorderView.hidden = YES;
    passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    passwordField.textField.secureTextEntry = YES;
    passwordField.textField.placeholder = NSLocalizedString(@"signUpView.passwordPlaceholder", @"Place holder text for password field");
    passwordField.delegate = self;
    [self.scrollView addSubview:passwordField];
    self.passwordField = passwordField;
    self.passwordField.required = YES;
    
    PMSingleLineFormField *confirmPasswordField = [PMSingleLineFormField new];
    confirmPasswordField.topBorderView.hidden = YES;
    confirmPasswordField.translatesAutoresizingMaskIntoConstraints = NO;
    confirmPasswordField.textField.secureTextEntry = YES;
    confirmPasswordField.textField.placeholder = NSLocalizedString(@"signUpView.confirmPasswordPlaceholder", @"Place holder text for confirm password field");
    confirmPasswordField.delegate = self;
    [self.scrollView addSubview:confirmPasswordField];
    self.confirmPasswordField = confirmPasswordField;
    self.confirmPasswordField.required = YES;
    
    self.formFields = @[firstNameField, lastNameField, emailField, userNameField, passwordField, confirmPasswordField];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(firstNameField, lastNameField, emailField, userNameField, passwordField, confirmPasswordField);
    NSDictionary *metrics = @{ @"fieldHeight" : @44, @"topHeight" : @60.0f ,@"spacer" : @12.0f };
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[firstNameField(==lastNameField)][lastNameField(==firstNameField)]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[firstNameField(==fieldHeight)][emailField(==fieldHeight)][userNameField(==fieldHeight)][passwordField(==fieldHeight)][confirmPasswordField(==fieldHeight)]-spacer-|" options:0 metrics:metrics views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[lastNameField(==fieldHeight)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[emailField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[userNameField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[passwordField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[confirmPasswordField]|" options:0 metrics:metrics views:views]];
    
    [self bindLeftEdgeOfView:firstNameField toView:self.view];
    [self bindRightEdgeOfView:lastNameField toView:self.view];
    [self bindLeftEdgeOfView:emailField toView:self.view];
    [self bindRightEdgeOfView:emailField toView:self.view];
    [self bindLeftEdgeOfView:userNameField toView:self.view];
    [self bindRightEdgeOfView:userNameField toView:self.view];
    [self bindLeftEdgeOfView:passwordField toView:self.view];
    [self bindRightEdgeOfView:passwordField toView:self.view];
    [self bindLeftEdgeOfView:confirmPasswordField toView:self.view];
    [self bindRightEdgeOfView:confirmPasswordField toView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)formAction
{
    
}

@end

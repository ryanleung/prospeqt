//
//  PMSignInViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMSignInViewController.h"

@interface PMSignInViewController ()
@property (nonatomic, strong) PMSingleLineFormField *emailField;
@property (nonatomic, strong) PMSingleLineFormField *passwordField;
@end

@implementation PMSignInViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"auth.signin", @"Title of sign in view");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"auth.signin", @"Sign in button title") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    
    PMSingleLineFormField *emailField = [PMSingleLineFormField new];
    emailField.translatesAutoresizingMaskIntoConstraints = NO;
    emailField.delegate = self;
    emailField.textField.placeholder = NSLocalizedString(@"signInView.emailPlaceholder", @"Place holder text for email field");
    [self.scrollView addSubview:emailField];
    self.emailField = emailField;
    
    PMSingleLineFormField *passwordField = [PMSingleLineFormField new];
    passwordField.translatesAutoresizingMaskIntoConstraints = NO;
    passwordField.topBorderView.hidden = YES;
    passwordField.delegate = self;
    passwordField.textField.secureTextEntry = YES;
    passwordField.textField.placeholder = NSLocalizedString(@"signInView.passwordPlaceholder", @"Place holder text for password field");
    [self.scrollView addSubview:passwordField];
    self.passwordField = passwordField;
    
    self.formFields = @[emailField, passwordField];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(emailField, passwordField);
    NSDictionary *metrics = @{ @"fieldHeight" : @44, @"topSpacer" : @34 ,@"leftSpacer" : @12.0f };
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[emailField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpacer-[emailField(==fieldHeight)][passwordField(==fieldHeight@1000)]-|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[passwordField]|" options:0 metrics:metrics views:views]];
    
    [self bindLeftEdgeOfView:emailField toView:self.view];
    [self bindRightEdgeOfView:emailField toView:self.view];
    [self bindLeftEdgeOfView:passwordField toView:self.view];
    [self bindRightEdgeOfView:passwordField toView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

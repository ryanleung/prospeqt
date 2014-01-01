//
//  PMSignInViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMSignInViewController.h"
#import "MBProgressHUD.h"

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

- (void)formAction
{
    if (!self.emailField.textField.text || !self.passwordField.textField.text) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"signIn.field.error", @"error") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    PMAccount *account = [[PMAccount alloc] init];
    account.email = self.emailField.textField.text;
    account.password = self.passwordField.textField.text;
    
    __weak typeof(self) weak_self = self;
    [MBProgressHUD showHUDWithTitle:NSLocalizedString(@"global.loading", @"Loading overlay text") view:self.view animated:YES];
    [self.networkController createSessionWithAccount:account completion:^(id response, NSError *error) {
        if (!error) {
            [[NSNotificationCenter defaultCenter] postNotificationName:kPMNotificationUserDidSignIn object:weak_self userInfo:nil];
        } else {
            [self handleError:error];
        }
        [MBProgressHUD hideHUDForView:weak_self.view animated:YES];
    }];
}

@end

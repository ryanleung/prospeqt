//
//  PMAuthViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAuthViewController.h"
#import "PMSignInViewController.h"
#import "PMSignUpViewController.h"

@interface PMAuthViewController ()

@end

@implementation PMAuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [signInButton setTitle:NSLocalizedString(@"auth.signin", @"Sign In") forState:UIControlStateNormal];
        [signInButton addTarget:self action:@selector(didTapSignInButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [signUpButton setTitle:NSLocalizedString(@"auth.signup", @"Sign up") forState:UIControlStateNormal];
        [signUpButton addTarget:self action:@selector(didTapSignUpButton:) forControlEvents:UIControlEventTouchUpInside];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(signUpButton, signInButton);
        for (UIView *view in views.allValues) {
            view.translatesAutoresizingMaskIntoConstraints = NO;
            [self.view addSubview:view];
        }
        
        NSDictionary *metrics = @{@"buttonWidth": @100, @"buttonHeight": @40, @"spacer": @50 };
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-spacer-[signInButton(==buttonHeight)]-[signUpButton(==buttonHeight)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[signUpButton(==buttonWidth)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[signInButton(==buttonWidth)]" options:NSLayoutFormatAlignAllCenterX metrics:metrics views:views]];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didTapSignInButton:(id)sender
{
    PMSignInViewController *signInViewController = [[PMSignInViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:signInViewController animated:YES];
}

- (void)didTapSignUpButton:(id)sender
{
    PMSignUpViewController *signUpViewController = [[PMSignUpViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:signUpViewController animated:YES];
}


@end

//
//  PMBaseViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMBaseViewController.h"
#import "UIColor+PMAppearance.h"

@interface PMBaseViewController ()

@end

@implementation PMBaseViewController

#pragma mark - Life Cycle

- (void)dealloc
{
//    [self.networkController cancelAllOperations];
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor pm_backgroundColor];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.backButton", @"Back button text") style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
}
#pragma mark - Authenticated Data

- (BOOL)needsUserAuthentication
{
    return NO;
}

- (void)setNeedsData
{
    [self.networkController authenticateIfNeededAndLoadData:self];
}

- (void)loadData
{
    // no-op: Subclasses should override
}

#pragma mark Error Handling

- (void)handleError:(NSError *)error
{
//    NSString *errorMessage = [LUVError messageFromError:error];
//    if (errorMessage) {
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"Default error title") message:errorMessage delegate:nil cancelButtonTitle:NSLocalizedString(@"global.dismiss", @"Dismiss the error button title") otherButtonTitles:nil];
//        [alertView show];
//    }
}

#pragma mark - Properties

- (PMNetworkController *)networkController
{
    if (!_networkController) {
        _networkController = [PMNetworkController new];
    }
    return _networkController;
}


#pragma mark - Status bar

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

- (CGFloat)pm_topInset
{
    if ([self respondsToSelector:@selector(topLayoutGuide)]) {
        return [self.topLayoutGuide length];
    } else {
        return 0;
    }
}

@end

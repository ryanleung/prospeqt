//
//  PMDoneViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 11/13/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMDoneViewController.h"
#import "PMCraigslistAdView.h"

@interface PMDoneViewController ()

@end

@implementation PMDoneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // TODO(ryan):change? something a little more celebratory?
        self.title = NSLocalizedString(@"done.title", @"Craigslist");
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.done", @"done") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
        
        self.view.backgroundColor = [UIColor pm_backgroundColor];
        
        UILabel *finalizeLabel = [UILabel new];
        finalizeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        finalizeLabel.font = [UIFont pm_futuraExtendedFontWithSize:20.0f];
        finalizeLabel.textColor = [UIColor pm_grayDarkColor];
        finalizeLabel.text = NSLocalizedString(@"done.finalize", @"finalize");
        [self.scrollView addSubview:finalizeLabel];
        
        PMCraigslistAdView *craigView = [PMCraigslistAdView new];
        craigView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scrollView addSubview:craigView];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(finalizeLabel, craigView);
        NSDictionary *metrics = @{ @"topSpacer": @10, @"bottomSpacer": @30, @"middleSpacer": @5 };
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpacer-[finalizeLabel]-middleSpacer-[craigView]-bottomSpacer-|" options:0 metrics:metrics views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[craigView]|" options:0 metrics:metrics views:views]];
        [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[finalizeLabel]|" options:0 metrics:metrics views:views]];
        
        [self bindLeftEdgeOfView:craigView toView:self.view];
        [self bindRightEdgeOfView:craigView toView:self.view];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)formAction
{
    // reset post listing vcs, move to first tab(listings vc)
    [self.tabBarController setSelectedIndex:0];
    [[self.tabBarController.viewControllers objectAtIndex:2] popToRootViewControllerAnimated:NO];
}
@end

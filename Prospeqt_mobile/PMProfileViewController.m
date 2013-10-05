//
//  PMProfileViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMProfileViewController.h"

@interface PMProfileViewController ()

@end

@implementation PMProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.profile.title", @"Profile");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.profile.title", @"Profile") image:[[UIImage imageNamed:@"Profile_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Profile_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

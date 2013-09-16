//
//  PMHomeViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMHomeViewController.h"

@interface PMHomeViewController ()

@end

@implementation PMHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.tabBarItem.title = NSLocalizedString(@"tabbar.home.title", @"Home");
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

//
//  PMListingsViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/2/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMListingsViewController.h"
#import "PMListingCell.h"

static NSString * const kListingCellIdentifier = @"listingCellIdentifier";

@interface PMListingsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PMListingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.listings.title", @"Listings");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.listings.title", @"Listings") image:[[UIImage imageNamed:@"Listings_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Listings_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource  = self;
        [tableView registerClass:[PMListingCell class] forCellReuseIdentifier:kListingCellIdentifier];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.scrollEnabled = YES;
        [self.view addSubview:tableView];
        self.tableView = tableView;
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

#pragma mark UITableViewDelegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

@end

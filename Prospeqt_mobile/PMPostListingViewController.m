//
//  PMPostListingViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMPostListingViewController.h"
#import "PMTitleCell.h"
#import "PMCategoryCell.h"
#import "PMAddPhotoViewController.h"

typedef NS_ENUM(NSUInteger, PMCategoryCellType) {
    PMCategoryCellTypeTitle = 0,
    PMCategoryCellTypeBooks,
    PMCategoryCellTypeFashion,
    PMCategoryCellTypeElectronics,
    PMCategoryCellTypeHealth,
    PMCategoryCellTypeHome,
    PMCategoryCellTypeInterests,
    PMCategoryCellCount
};

static NSString * const kTitleCellIdentifier = @"titleCellIdentifier";
static NSString * const kCategoryCellIdentifier = @"categoryCellIdentifier";

@interface PMPostListingViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation PMPostListingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.postListing.title", @"Post a Listing");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.postListing.title", @"Post Listing") image:[[UIImage imageNamed:@"PostAListing_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"PostAListing_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.scrollEnabled = NO;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource  = self;
        [tableView registerClass:[PMTitleCell class] forCellReuseIdentifier:kTitleCellIdentifier];
        [tableView registerClass:[PMCategoryCell class] forCellReuseIdentifier:kCategoryCellIdentifier];
        tableView.backgroundColor = [UIColor clearColor];
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
    return PMCategoryCellCount;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // hide separator view of cell above.
    
    PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
    switch (indexPath.row) {
        case PMCategoryCellTypeTitle:
            cell.separatorVisible = YES;
            break;
        default:
            cell.separatorVisible = NO;
            break;
    }
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // show separator view of cell above.
    if (indexPath.row != 0) {
        PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
        if (cell) {
            cell.separatorVisible = YES;
        } else {
            // If the cell can't be found brute-force the cell separator flag. This can occur if the user scrolls the table view while a cell is highlighted. In this case the unhighlighted indexPath is INT_MAX. This is specifically an iOS 6 issue that is resolved in iOS 7.
            for (PMCell *itemCell in [self.tableView visibleCells]) {
                itemCell.separatorVisible = YES;
            }
        }
    }
}

- (PMCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = nil;
    switch (indexPath.row) {
        case PMCategoryCellTypeTitle:
            cell = [tableView dequeueReusableCellWithIdentifier:kTitleCellIdentifier];
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:kCategoryCellIdentifier];
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(PMCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCategoryCellTypeTitle:
            cell.textLabel.text = NSLocalizedString(@"post.cell.title", @"title");
            [cell useLastItemSeparator:YES];
            break;
        case PMCategoryCellTypeBooks:
            cell.textLabel.text = NSLocalizedString(@"post.category.book", @"books");
            cell.imageView.image = [UIImage imageNamed:@"books_icon"];
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeFashion:
            cell.textLabel.text = NSLocalizedString(@"post.category.fashion", @"fashion");
            cell.imageView.image = [UIImage imageNamed:@"apparel_icon"];
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeElectronics:
            cell.textLabel.text = NSLocalizedString(@"post.category.electronics", @"electronics");
            cell.imageView.image = [UIImage imageNamed:@"electronics_icon"];
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeHealth:
            cell.textLabel.text = NSLocalizedString(@"post.category.health", @"health");
            cell.imageView.image = [UIImage imageNamed:@"healthbeauty_icon"];
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeHome:
            cell.textLabel.text = NSLocalizedString(@"post.category.home", @"home");
            cell.imageView.image = [UIImage imageNamed:@"home_icon"];
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeInterests:
            cell.textLabel.text = NSLocalizedString(@"post.category.interests", @"interests");
            cell.imageView.image = [UIImage imageNamed:@"interestshobbies_icon"];
            [cell useLastItemSeparator:YES];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCategoryCellTypeTitle:
            break;
        default: {
            PMAddPhotoViewController *addPhotoViewController = [[PMAddPhotoViewController alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:addPhotoViewController animated:YES];
            break;
        }
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    cell.highlighted = NO;
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PMCategoryCell cellHeight];
}
@end

//
//  PMSettingsViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMSettingsViewController.h"
#import "PMTitleCell.h"
#import "PMDiscloseIndicatorCell.h"

typedef NS_ENUM(NSUInteger, PMCategoryCellType) {
    PMCategoryCellTypeAccountTitle = 0,
    PMCategoryCellTypeEditProfile,
    PMCategoryCellTypeBanksAndCards,
    PMCategoryCellTypeInformationTitle,
    PMCategoryCellTypeContactUs,
    PMCategoryCellTypeHelpCenter,
    PMCategoryCellTypeLogOut,
    PMCategoryCellCount
};

static NSString * const kTitleCellIdentifier = @"titleCellIdentifier";
static NSString * const kCategoryCellIdentifier = @"categoryCellIdentifier";

@interface PMSettingsViewController ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation PMSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.settings.title", @"Settings");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.settings.title", @"Settings") image:[[UIImage imageNamed:@"Settings_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Settings_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.scrollEnabled = YES;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource  = self;
        [tableView registerClass:[PMTitleCell class] forCellReuseIdentifier:kTitleCellIdentifier];
        [tableView registerClass:[PMDiscloseIndicatorCell class] forCellReuseIdentifier:kCategoryCellIdentifier];
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
        case PMCategoryCellTypeAccountTitle:
        case PMCategoryCellTypeInformationTitle:
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
        case PMCategoryCellTypeAccountTitle:
        case PMCategoryCellTypeInformationTitle:
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
        case PMCategoryCellTypeAccountTitle:
            cell.textLabel.text = NSLocalizedString(@"settings.accountTitle", @"account and payments");
            [cell useLastItemSeparator:YES];
            break;
        case PMCategoryCellTypeEditProfile:
            cell.textLabel.text = NSLocalizedString(@"settings.editProfile", @"edit profile");
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeBanksAndCards:
            cell.textLabel.text = NSLocalizedString(@"settings.banksAndCards", @"banks and cards");
            [cell useLastItemSeparator:YES];
            break;
        case PMCategoryCellTypeInformationTitle:
            cell.textLabel.text = NSLocalizedString(@"settings.informationTitle", @"information and support");
            [cell useLastItemSeparator:YES];
            break;
        case PMCategoryCellTypeContactUs:
            cell.textLabel.text = NSLocalizedString(@"settings.contactUs", @"contact us");
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeHelpCenter:
            cell.textLabel.text = NSLocalizedString(@"settings.helpCenter", @"help center");
            [cell useLastItemSeparator:NO];
            break;
        case PMCategoryCellTypeLogOut:
            cell.textLabel.text = NSLocalizedString(@"settings.logOut", @"log out");
            [cell useLastItemSeparator:YES];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCategoryCellTypeAccountTitle:
        case PMCategoryCellTypeInformationTitle:
            break;
        default: {
            //PMAddTitleAndPriceViewController *addDescriptionViewController = [[PMAddTitleAndPriceViewController alloc] initWithNibName:nil bundle:nil];
            //[self.navigationController pushViewController:addDescriptionViewController animated:YES];
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
    return [PMDiscloseIndicatorCell cellHeight];
}

@end

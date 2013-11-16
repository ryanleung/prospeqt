//
//  PMEditProfileViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/28/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMEditProfileViewController.h"
#import "PMSingleLineFormField.h"
#import "PMCell.h"

typedef NS_ENUM(NSUInteger, PMCellType) {
    PMCellTypeName = 0,
    PMCellTypeLocation,
    PMCellTypeEditEmptySpaceOne,
    PMCellTypeTakeNewPhoto,
    PMCellTypeChooseFromLibrary,
    PMCellTypeEmptySpaceTwo,
    PMCellTypeEditBio,
    PMCellTypeEditSocialProfiles,
    PMCellCount
};

@interface PMEditProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@end

@implementation PMEditProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"profile.edit.title", @"Edit Profile");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.save", @"save") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
   
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.scrollEnabled = YES;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource  = self;
//    [tableView registerClass:[PMTitleCell class] forCellReuseIdentifier:kTitleCellIdentifier];
//    [tableView registerClass:[PMCell class] forCellReuseIdentifier:kMiscCellIdentifier];
//    [tableView registerClass:[PMAddressCell class] forCellReuseIdentifier:kAddressCellIdentifier];
//    [tableView registerClass:[PMSitePostCell class] forCellReuseIdentifier:kSitePostCellIdentifier];
    tableView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:tableView];
//    self.tableView = tableView;
    
}

#pragma mark UITableViewDelegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return PMCellCount;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // hide separator view of cell above.
    
    //    PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
    //    switch (indexPath.row) {
    //        case PMCategoryCellTypeTitle:
    //            cell.separatorVisible = YES;
    //            break;
    //        default:
    //            cell.separatorVisible = NO;
    //            break;
    //    }
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // show separator view of cell above.
    //    if (indexPath.row != 0) {
    //        PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
    //        if (cell) {
    //            cell.separatorVisible = YES;
    //        } else {
    //            // If the cell can't be found brute-force the cell separator flag. This can occur if the user scrolls the table view while a cell is highlighted. In this case the unhighlighted indexPath is INT_MAX. This is specifically an iOS 6 issue that is resolved in iOS 7.
    //            for (PMCell *itemCell in [self.tableView visibleCells]) {
    //                itemCell.separatorVisible = YES;
    //            }
    //        }
    //    }
}

- (PMCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = nil;
//    switch (indexPath.row) {
//        case PMCellTypeMeetTitle:
//        case PMCellTypeWherePostTitle:
//            cell = [tableView dequeueReusableCellWithIdentifier:kTitleCellIdentifier];
//            break;
//        case PMCellTypeAddress:
//            cell = [tableView dequeueReusableCellWithIdentifier:kAddressCellIdentifier];
//            break;
//        case PMCellTypeAddressNotes:
//            cell = [tableView dequeueReusableCellWithIdentifier:kMiscCellIdentifier];
//            break;
//        case PMCellTypeCraigslist:
//        case PMCellTypeFacebook:
//        case PMCellTypeFreeForSale:
//            cell = [tableView dequeueReusableCellWithIdentifier:kSitePostCellIdentifier];
//            break;
//        default:
//            break;
//    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(PMCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    switch (indexPath.row) {
//        case PMCellTypeMeetTitle:
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.meet.title", @"meet title");
//            cell.textLabel.font = [UIFont pm_futuraExtendedFontWithSize:19.0f];
//            [cell useLastItemSeparator:YES];
//            break;
//        case PMCellTypeAddress:
//            // if case with default address/most used address (same as luv)
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.address.default", @"Default Address");
//            [cell useLastItemSeparator:YES];
//            break;
//        case PMCellTypeAddressNotes:
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.address.notes", @"address notes");
//            cell.textLabel.font = [UIFont pm_futuraLightFontWithSize:15.0f];
//            cell.textLabel.textAlignment = NSTextAlignmentCenter;
//            cell.textLabel.textColor = [UIColor pm_grayDarkColor];
//            cell.textLabel.numberOfLines = 2;
//            cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
//            [cell useLastItemSeparator:YES];
//            break;
//        case PMCellTypeWherePostTitle:
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.sitePost.title", @"post title");
//            cell.textLabel.font = [UIFont pm_futuraExtendedFontWithSize:19.0f];
//            [cell useLastItemSeparator:YES];
//            break;
//        case PMCellTypeCraigslist:
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.craigslist", @"craigslist");
//            [cell useLastItemSeparator:NO];
//            break;
//        case PMCellTypeFreeForSale:
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.ffs", @"ffs");
//            [cell useLastItemSeparator:NO];
//            break;
//        case PMCellTypeFacebook:
//            cell.textLabel.text = NSLocalizedString(@"finalizePost.facebook", @"facebook");
//            [cell useLastItemSeparator:YES];
//            break;
//        default:
//            break;
//    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    switch (indexPath.row) {
//        case PMCellTypeAddress: {
//            PMAddressViewController *addressViewController = [[PMAddressViewController alloc] initWithNibName:nil bundle:nil];
//            [self.navigationController pushViewController:addressViewController animated:YES];
//        }
//            break;
//        default:
//            break;
//    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    cell.highlighted = NO;
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PMCell cellHeight];
}

#pragma mark - Form Actions

- (void)formAction
{
    
}

@end

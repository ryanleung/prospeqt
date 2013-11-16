//
//  PMFinalizePostViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMFinalizePostViewController.h"
#import "PMTitleCell.h"
#import "PMAddressCell.h"
#import "PMSitePostCell.h"
#import "PMAddressViewController.h"
#import "PMDoneViewController.h"
#import <RestKit/RestKit.h>


typedef NS_ENUM(NSUInteger, PMCellType) {
    PMCellTypeMeetTitle = 0,
    PMCellTypeAddress,
    PMCellTypeAddressNotes,
    PMCellTypeWherePostTitle,
    PMCellTypeCraigslist,
    PMCellTypeFreeForSale,
    PMCellTypeFacebook,
    PMCellCount
};

static NSString * const kTitleCellIdentifier = @"titleCellIdentifier";
static NSString * const kMiscCellIdentifier = @"miscCellIdentifier";
static NSString * const kSitePostCellIdentifier = @"sitePostCellIdentifier";
static NSString * const kAddressCellIdentifier = @"addressCellIdentifier";

@interface PMFinalizePostViewController () <UITableViewDataSource, UITableViewDelegate, PMAddressViewControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) PMListing *listing;
@property (nonatomic, strong) PMAddress *chosenAddress;
@end


@implementation PMFinalizePostViewController

- (id)initWithListing:(PMListing *)listing
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.listing = listing;
        
        self.title = NSLocalizedString(@"finalizePost.title", @"Finalize Post");
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.post", @"post") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.scrollEnabled = YES;
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource  = self;
        [tableView registerClass:[PMTitleCell class] forCellReuseIdentifier:kTitleCellIdentifier];
        [tableView registerClass:[PMCell class] forCellReuseIdentifier:kMiscCellIdentifier];
        [tableView registerClass:[PMAddressCell class] forCellReuseIdentifier:kAddressCellIdentifier];
        [tableView registerClass:[PMSitePostCell class] forCellReuseIdentifier:kSitePostCellIdentifier];
        tableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return self;
}

#pragma mark - Data loading operations

- (void)loadData
{
    
}

#pragma mark UITableViewDelegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return PMCellCount;
}

- (PMCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = nil;
    switch (indexPath.row) {
        case PMCellTypeMeetTitle:
        case PMCellTypeWherePostTitle:
            cell = [tableView dequeueReusableCellWithIdentifier:kTitleCellIdentifier];
            break;
        case PMCellTypeAddress:
            cell = [tableView dequeueReusableCellWithIdentifier:kAddressCellIdentifier];
            break;
        case PMCellTypeAddressNotes:
            cell = [tableView dequeueReusableCellWithIdentifier:kMiscCellIdentifier];
            break;
        case PMCellTypeCraigslist:
        case PMCellTypeFacebook:
        case PMCellTypeFreeForSale:
            cell = [tableView dequeueReusableCellWithIdentifier:kSitePostCellIdentifier];
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(PMCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCellTypeMeetTitle:
            cell.textLabel.text = NSLocalizedString(@"finalizePost.meet.title", @"meet title");
            cell.textLabel.font = [UIFont pm_futuraExtendedFontWithSize:19.0f];
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeAddress:
            // if case with default address/most used address (same as luv)
            if (!self.chosenAddress) {
                cell.textLabel.text = NSLocalizedString(@"finalizePost.address.default", @"Default Address");
            } else {
                cell.textLabel.text = self.chosenAddress.streetAddress;
            }
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeAddressNotes:
            cell.textLabel.text = NSLocalizedString(@"finalizePost.address.notes", @"address notes");
            cell.textLabel.font = [UIFont pm_futuraLightFontWithSize:15.0f];
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor pm_grayDarkColor];
            cell.textLabel.numberOfLines = 2;
            cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeWherePostTitle:
            cell.textLabel.text = NSLocalizedString(@"finalizePost.sitePost.title", @"post title");
            cell.textLabel.font = [UIFont pm_futuraExtendedFontWithSize:19.0f];
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeCraigslist:
            cell.textLabel.text = NSLocalizedString(@"finalizePost.craigslist", @"craigslist");
            [cell useLastItemSeparator:NO];
            break;
        case PMCellTypeFreeForSale:
            cell.textLabel.text = NSLocalizedString(@"finalizePost.ffs", @"ffs");
            [cell useLastItemSeparator:NO];
            break;
        case PMCellTypeFacebook:
            cell.textLabel.text = NSLocalizedString(@"finalizePost.facebook", @"facebook");
            [cell useLastItemSeparator:YES];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCellTypeAddress: {
            PMAddressViewController *addressViewController = [[PMAddressViewController alloc] initWithNibName:nil bundle:nil];
            addressViewController.delegate = self;
            [self.navigationController pushViewController:addressViewController animated:YES];
        }
            break;
        default:
            break;
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
    return [PMCell cellHeight];
}

#pragma mark - Address Delegate methods

- (void)addressViewController:(PMAddressViewController *)addressViewController didCreateNewAddress:(PMAddress *)address
{
    self.chosenAddress = address;
    self.listing.city = self.chosenAddress.city;
    self.listing.state = self.chosenAddress.state;
    [self.tableView reloadRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:PMCellTypeAddress inSection:0] ] withRowAnimation:UITableViewRowAnimationNone];
}

#pragma mark - Form Actions

- (void)formAction
{
    [self.networkController.mainContext saveToPersistentStore:nil];
    PMDoneViewController *doneViewController = [PMDoneViewController new];
    [self.navigationController pushViewController:doneViewController animated:YES];
}

@end

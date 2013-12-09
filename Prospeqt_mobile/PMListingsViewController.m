//
//  PMListingsViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/2/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMListingsViewController.h"
#import "PMListingCell.h"
#import "PMListing.h"
#import "PMObjectManager.h"
#import <RestKit/UIImageView+AFNetworking.h>
#import "PMManageListingViewController.h"
#import "PMEmptyListingsView.h"

static NSString * const kListingCellIdentifier = @"listingCellIdentifier";

@interface PMListingsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) PMEmptyListingsView *emptyListingsView;
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
        
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"listings.refresh.title", @"fetching listings")];
        [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor pm_grayDarkColor] range:(NSRange){0, NSLocalizedString(@"listings.refresh.title", @"fetching listings").length}];
        refreshControl.attributedTitle = attrString;
        refreshControl.tintColor = [UIColor pm_grayMediumColor];
        
        PMEmptyListingsView *emptyListingsView = [[PMEmptyListingsView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:emptyListingsView];
        self.emptyListingsView = emptyListingsView;
        
        [self.tableView addSubview:refreshControl];
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
    
    [self.fetchedResultsController performFetch:nil];
    if (self.fetchedResultsController.fetchedObjects.count == 0) {
        self.emptyListingsView.hidden = NO;
        self.tableView.hidden = YES;
    } else {
        self.emptyListingsView.hidden = YES;
        self.tableView.hidden = NO;
        [self.tableView reloadData];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self setNeedsData];
}

#pragma mark - Data Loading

- (BOOL)needsUserAuthentication
{
    return YES;
}

- (void)loadData
{
    
}

#pragma mark UITableViewDelegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}

- (PMListingCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:kListingCellIdentifier];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(PMListingCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMListing *listing = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.productTitleLabel.text = listing.title;
    cell.productDetailLabel.text = listing.info;
    
    NSString *dateFormat = NSLocalizedString(@"listings.date.format", @"date format");
    cell.dateLabel.text = [NSString stringWithFormat:dateFormat, [PMListing formattedDate:listing.date]];
    
    [cell updatePrice:listing.price];
    
    if (listing.picData1) {
        cell.productImageView.image = [UIImage imageWithData:listing.picData1];
    }
    
//    __weak PMListingCell *weak_cell = cell;
//    UIImageView *placeholder = [[UIImageView alloc] initWithFrame:(CGRect) {{ 0.0f, 0.0f }, { 40.0f, 40.0f}}];
//    [cell.productImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listing.picUrl]] placeholderImage:placeholder.image success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//        weak_cell.productImageView.image = image;
//        [weak_cell setNeedsLayout];
//        weak_cell.separatorView.layer.zPosition = MAXFLOAT;
//    } failure:nil];
    
    
    [cell useLastItemSeparator:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PMListingCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedListing = [self.fetchedResultsController objectAtIndexPath:indexPath];
    PMManageListingViewController *manageListingViewController = [[PMManageListingViewController alloc] initWithListing:self.selectedListing];
    [self.navigationController pushViewController:manageListingViewController animated:YES];
}

#pragma mark - Refresh Control

- (void)refresh:(id)sender
{
    sleep(2);
    [(UIRefreshControl *)sender endRefreshing];
}
#pragma mark - Core Data

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController == nil) {
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[PMListing entityName]];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
        fetchRequest.sortDescriptors = @[sortDescriptor];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.networkController.mainContext sectionNameKeyPath:nil cacheName:nil];
        [_fetchedResultsController performFetch:nil];
    }
    return _fetchedResultsController;
}


@end

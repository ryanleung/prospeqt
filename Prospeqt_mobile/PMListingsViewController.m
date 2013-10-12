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

static NSString * const kListingCellIdentifier = @"listingCellIdentifier";

@interface PMListingsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
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
        
        [self.fetchedResultsController performFetch:nil];
        
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:[self.fetchedResultsController.sections[0] indexOfObject:self.selectedListing] inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
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
    cell.dateLabel.text = [NSString stringWithFormat:dateFormat, [PMListingCell formattedDate:listing.date]];
    
    [cell updatePrice:listing.price];
    
    __weak PMListingCell *weak_cell = cell;
    UIImageView *placeholder = [[UIImageView alloc] initWithFrame:(CGRect) {{ 0.0f, 0.0f }, { 40.0f, 40.0f}}];
    [cell.productImageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:listing.picPath]] placeholderImage:placeholder.image success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        weak_cell.productImageView.image = image;
        [weak_cell setNeedsLayout];
        weak_cell.separatorView.layer.zPosition = MAXFLOAT;
    } failure:nil];
    
    
    [cell useLastItemSeparator:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [PMListingCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - Core Data

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController == nil) {
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[PMListing entityName]];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
        fetchRequest.sortDescriptors = @[sortDescriptor];
        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[[PMObjectManager sharedPMObjectManager] managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
        [_fetchedResultsController performFetch:nil];
    }
    return _fetchedResultsController;
}


@end

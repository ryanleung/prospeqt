//
//  PMMessagesViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMMessagesViewController.h"
#import "PMMessageCell.h"
#import "PMMessageChain.h"

static NSString * const kMessageCellIdentifier = @"messageCellIdentifier";

@interface PMMessagesViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation PMMessagesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.messages.title", @"Messages");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.messages.title", @"Messages") image:[[UIImage imageNamed:@"Inbox_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Inbox_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[PMMessageCell class] forCellReuseIdentifier:kMessageCellIdentifier];
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

#pragma mark - Core Data

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController == nil) {
        NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[PMMessageChain entityName]];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"lastUpdated" ascending:YES];
        fetchRequest.sortDescriptors = @[sortDescriptor];
//        _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:[[PMObjectManager sharedPMObjectManager] managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
        [_fetchedResultsController performFetch:nil];
    }
    return _fetchedResultsController;
}
@end

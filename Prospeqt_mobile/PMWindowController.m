//
//  PMWindowController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/11/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMWindowController.h"
#import "PMNetworkController.h"
#import "PMProfileViewController.h"
#import "PMMessagesViewController.h"
#import "PMSettingsViewController.h"
#import "PMListingsViewController.h"
#import "PMPostListingViewController.h"
#import "PMAuthViewController.h"
#import "PMAuthenticationDelegate.h"
#import "PMDataLoadProtocol.h"
#import "PMAuthNavigationController.h"
#import "PMAppearance.h"

@interface PMWindowController() <PMAuthenticationDelegate, PMDataLoadProtocol>

@property (nonatomic, strong) UITabBarController *rootViewController;
@property (nonatomic, strong) PMProfileViewController *profileViewController;
@property (nonatomic, strong) PMMessagesViewController *messagesViewController;
@property (nonatomic, strong) PMSettingsViewController *settingsViewController;
@property (nonatomic, strong) PMListingsViewController *listingsViewController;
@property (nonatomic, strong) PMPostListingViewController *postListingViewController;

@property (nonatomic, strong) NSMutableArray *loadDataOperations;
@property (nonatomic, strong) NSOperationQueue *loadDataQueue;

@property (nonatomic, strong) UIViewController *presentationViewController;
@property (nonatomic, strong) PMNetworkController *networkController;
@end

@implementation PMWindowController

- (id)init
{
    self = [super init];
    if (self) {
        _loadDataOperations = [NSMutableArray array];
        _loadDataQueue = [NSOperationQueue new];
        
        [PMAppearance applyAppearance];
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = self.rootViewController;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userNeedsAuthentication:) name:kPMNotificationUserNeedsAuthenticated object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidSignOut:) name:kPMNotificationUserDidSignOut object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDidSignIn:) name:kPMNotificationUserDidSignIn object:nil];
        
        [self setNeedsData];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark - Notification

- (void)userNeedsAuthentication:(NSNotification *)notification
{
    if ([self.presentationViewController isKindOfClass:[PMAuthNavigationController class]]) {
        return;
    }
    
    [self addLoadDataOperationForObject:notification.object];
    
    SEL presentAuthSelector = @selector(presentAuthControllerIfNeeded);
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:presentAuthSelector object:nil];
    [self performSelector:presentAuthSelector withObject:nil afterDelay:0.0];
}

- (void)userDidSignIn:(NSNotification *)notification
{
    [self.rootViewController dismissViewControllerAnimated:YES completion:^{
        [self.loadDataQueue addOperations:self.loadDataOperations waitUntilFinished:NO];
        [self.loadDataOperations removeAllObjects];
    }];
    
    // Update UA with new username;
//    [UAPush shared].alias = self.networkController.currentUsername;
//    [[UAPush shared] updateRegistration];
}


//- (void)userDidSignOut:(NSNotification *)notification
//{
//    // with authentication being handled on demand, simply route the user to the default view
//    [self openLink:[LUVLink linkToTrendingFeed] animated:NO];
//    
//    //Clear username alias from UA
//    [UAPush shared].alias = nil;
//    [[UAPush shared] updateRegistration];
//    
//    //Sign out of FB
//    if (FBSession.activeSession.isOpen) {
//        // In order to fix, see discussion here: http://stackoverflow.com/questions/9110740/login-logout-issue-with-facebook-ios-sdk
//        // This way, we would need to access facebook sdk.
//        // if you want to completely logout of fb and, when signing on again, have to type in pass, then this is the way.
//        // otherwise, if you want to stay logged into FB through safari, the way above works. Which is the correct behavior?
//        // Will delete these comments once a conclusion hags been made :).
//        [FBSession.activeSession closeAndClearTokenInformation];
//    }
//}

#pragma mark - Authentication

- (void)presentAuthControllerIfNeeded
{
    PMAuthViewController *controller = [[PMAuthViewController alloc] initWithNibName:nil bundle:nil];
    PMAuthNavigationController *navController = [[PMAuthNavigationController alloc] initWithRootViewController:controller];
    navController.authenticationDelegate = self;
    
    [self.rootViewController presentViewController:navController animated:NO completion:nil];
}

#pragma mark - PMDataLoadProtocol

- (void)setNeedsData
{
    [self.networkController authenticateIfNeededAndLoadData:self];
}

- (BOOL)needsUserAuthentication
{
    return YES;
}

- (void)loadData
{
//    NSDate *lastCategoryUpdate = [[NSUserDefaults standardUserDefaults] objectForKey:@"lastCategoryUpdate"];
//    if (!lastCategoryUpdate || [[NSDate date] timeIntervalSinceDate:lastCategoryUpdate] > kLUVSecondsToRefresh) {
//        [self.networkController synchronizeCategories];
//        [[NSUserDefaults standardUserDefaults] setObject:[NSDate date] forKey:@"lastCategoryUpdate"];
//        [[NSUserDefaults standardUserDefaults] synchronize];
//    }
//    [self.networkController synchronizeCategories];
//    [self.networkController synchronizeUserTrusts];
}

#pragma mark - LUVLoadDataProtocol Helpers

- (void)addLoadDataOperationForObject:(NSObject *)object
{
    if ([object respondsToSelector:@selector(loadData)]) {
        __weak NSObject *weak_object = object;
        [self.loadDataOperations addObject:[NSBlockOperation blockOperationWithBlock:^{
            [weak_object performSelectorOnMainThread:@selector(loadData) withObject:nil waitUntilDone:NO];
        }]];
    }
}

#pragma mark - View controller helpers

- (UITabBarController *)rootViewController
{
    if (!_rootViewController) {
        _rootViewController = [[UITabBarController alloc] init];
        
        _rootViewController.viewControllers = @[[self navEmbeddedViewController:self.listingsViewController], [self navEmbeddedViewController:self.profileViewController], [self navEmbeddedViewController:self.postListingViewController], [self navEmbeddedViewController:self.messagesViewController], [self navEmbeddedViewController:self.settingsViewController]];
    }
    return _rootViewController;
}

- (UINavigationController *)navEmbeddedViewController:(PMBaseViewController *)baseViewController
{
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:baseViewController];
    return navController;
}
- (PMProfileViewController *)profileViewController
{
    if (!_profileViewController) {
        _profileViewController = [PMProfileViewController new];
    }
    return _profileViewController;
}

- (PMMessagesViewController *)messagesViewController
{
    if (!_messagesViewController) {
        _messagesViewController = [PMMessagesViewController new];
    }
    return _messagesViewController;
}

- (PMSettingsViewController *)settingsViewController
{
    if (!_settingsViewController) {
        _settingsViewController = [PMSettingsViewController new];
    }
    return _settingsViewController;
}

- (PMListingsViewController *)listingsViewController
{
    if (!_listingsViewController) {
        _listingsViewController = [PMListingsViewController new];
    }
    return _listingsViewController;
}

- (PMPostListingViewController *)postListingViewController
{
    if (!_postListingViewController) {
        _postListingViewController = [PMPostListingViewController new];
    }
    return  _postListingViewController;
}
@end

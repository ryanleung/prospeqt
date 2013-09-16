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
#import "PMHomeViewController.h"

@interface PMWindowController()

@property (nonatomic, strong) UITabBarController *rootViewController;
@property (nonatomic, strong) PMProfileViewController *profileViewController;
@property (nonatomic, strong) PMMessagesViewController *messagesViewController;
@property (nonatomic, strong) PMSettingsViewController *settingsViewController;
@property (nonatomic, strong) PMHomeViewController *homeViewController;

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
        
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = self.rootViewController;
    }
    return self;
}

#pragma mark - View controller helpers

- (UITabBarController *)rootViewController
{
    if (!_rootViewController) {
        _rootViewController = [[UITabBarController alloc] init];
        _rootViewController.viewControllers = @[self.homeViewController, self.profileViewController, self.messagesViewController, self.settingsViewController];
    }
    return _rootViewController;
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

- (PMHomeViewController *)homeViewController
{
    if (!_homeViewController) {
        _homeViewController = [PMHomeViewController new];
    }
    return _homeViewController;
}

@end

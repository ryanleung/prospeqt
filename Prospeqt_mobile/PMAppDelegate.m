//
//  PMAppDelegate.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/1/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAppDelegate.h"
#import "PMWindowController.h"
#import <RestKit/RestKit.h>
#import "PMObjectManager.h"
#import "PMUser.h"
#import "PMListing.h"

@interface PMAppDelegate()
@property (nonatomic, strong) PMWindowController *windowController;
@end
@implementation PMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.windowController = [PMWindowController new];
    [self.windowController.window makeKeyAndVisible];

    
    //TODO: BUGGY! calling this WILL crash the code, but will delete the data.
    // just comment out if you want to delete data
//    [[PMObjectManager sharedPMObjectManager] resetPersistentStore];
    // inputting test data
    NSManagedObjectContext *context = [[PMObjectManager sharedPMObjectManager] managedObjectContext];
    
    PMUser *jacq = [PMUser insertInManagedObjectContext:context];
    
    jacq.username = @"jacq";
    
    PMUser *mrsVo = [PMUser insertInManagedObjectContext:context];
    
    mrsVo.username = @"mrsVo";
    
    PMListing *listing1 = [PMListing insertInManagedObjectContext:context];
    
    
    listing1.info = @"Mint Condition, 15 inch";
    listing1.picUrl = @"http://g-ecx.images-amazon.com/images/G/01/electronics/apple/apple-12q2-macbook-pro-15-front-lg.jpg";
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setDay:10];
    [dateComps setMonth:10];
    [dateComps setYear:2010];
    listing1.date = [[NSCalendar currentCalendar] dateFromComponents:dateComps];
    
    listing1.listingId = @1;
    
    listing1.price = [NSDecimalNumber decimalNumberWithString:@"3.55"];
    
    listing1.title = @"Macbook Pro";
    
    listing1.state = @"CA";
    listing1.city = @"San Francisco";
    
    PMListing *listing2 = [PMListing insertInManagedObjectContext:context];
    
    listing2.info = @"Ugly Condition, 50 inch";
    
    listing2.listingId = @2;
    
    listing2.price = [NSDecimalNumber decimalNumberWithString:@"500"];
    listing2.picUrl = @"http://cdn-static.zdnet.com/i/story/61/18/005888/windows-pc.jpg";
    [dateComps setDay:11];
    [dateComps setMonth:10];
    [dateComps setYear:2013];
    listing2.date = [[NSCalendar currentCalendar] dateFromComponents:dateComps];
    
    listing2.title = @"Windows";
    
    listing2.state = @"AZ";
    listing2.city = @"Phoenix";
    
    [jacq addListings:[[NSSet alloc] initWithArray:@[listing1, listing2]]];
     
    NSError *error = nil;
    if ([context save:&error])
    {
        NSLog(@"THE SAVE WAS SUCCESSFUL");
    } else {
        NSLog(@"THE SAVE WASNT SUCCESSFUL: %@", [error userInfo]);
    }
    
    // reading data to see if correct
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Listing" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:nil];
    
    
    return YES;
}
@end

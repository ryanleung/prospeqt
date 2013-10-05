//
//  PMBaseViewController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMNetworkController.h"
#import "PMDataLoadProtocol.h"

@interface PMBaseViewController : UIViewController <PMDataLoadProtocol>

@property (nonatomic, strong) PMNetworkController *networkController;

- (void)handleError:(NSError *)error;

@end

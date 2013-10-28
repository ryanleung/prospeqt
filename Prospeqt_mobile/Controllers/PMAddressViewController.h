//
//  PMAddressViewController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/21/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMFormBaseViewController.h"

@class PMAddressViewController, PMAddress;

@protocol PMAddressViewControllerDelegate <NSObject>

- (void)addressViewController:(PMAddressViewController *)addressViewController didCreateNewAddress:(PMAddress *)address;

@end

@interface PMAddressViewController : PMFormBaseViewController

@property (nonatomic, weak) id<PMAddressViewControllerDelegate> delegate;

@end

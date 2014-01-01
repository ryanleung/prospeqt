//
//  PMEditProfileViewController.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/28/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMFormBaseViewController.h"

@protocol PMEditProfileViewControllerDelegate <NSObject>

- (void)profileDidEndEditingWithSave;

@end

@interface PMEditProfileViewController : PMBaseViewController

@property (nonatomic, weak) id<PMEditProfileViewControllerDelegate> delegate;

- (id)initWithUser:(PMUser *)user;

@end

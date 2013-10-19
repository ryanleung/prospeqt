//
//  PMAddDescriptionViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddDescriptionViewController.h"
#import "PMSingleLineFormField.h"

@interface PMAddDescriptionViewController ()
@property (nonatomic, weak) PMSingleLineFormField *listingNameField;
@property (nonatomic, weak) PMSingleLineFormField *priceField;
@end

@implementation PMAddDescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.title = NSLocalizedString(@"addDescription.title", @"Add Description");
        
        PMSingleLineFormField *nameField = [PMSingleLineFormField new];
        nameField.translatesAutoresizingMaskIntoConstraints = NO;
        [self.scrollView addSubview:nameField];
        self.listingNameField = nameField;
        
//        PMSingleLineFormField *
    }
    return self;
}

@end

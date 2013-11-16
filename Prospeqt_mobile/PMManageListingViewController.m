//
//  PMManageListingViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/12/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMManageListingViewController.h"
#import "PMListing.h"
#import "UIColor+PMAppearance.h"
#import "UIFont+PMAppearance.h"
#import "PMManageListingBoxView.h"
#import "PMButton.h"

@interface PMManageListingViewController ()
@property (nonatomic, strong) PMListing *currentListing;
@end

@implementation PMManageListingViewController

- (id)initWithListing:(PMListing *)listing
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.currentListing = listing;
        self.title = NSLocalizedString(@"manageListing.title", @"Manage Listing");
        self.view.backgroundColor = [UIColor pm_backgroundColor];
        
        
        // top view
        UILabel *listingLabel = [UILabel new];
        listingLabel.text = listing.title;
        listingLabel.translatesAutoresizingMaskIntoConstraints = NO;
        listingLabel.textColor = [UIColor pm_grayDarkColor];
        listingLabel.font = [UIFont pm_futuraExtendedFontWithSize:25.0f];
        [self.view addSubview:listingLabel];
        
        UIImageView *locationIconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"LocationPin"]];
        locationIconImageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.view addSubview:locationIconImageView];
        
        UILabel *locationLabel = [UILabel new];
        NSString *locationFormat = NSLocalizedString(@"global.locationFormat", @"locationFormat");
        locationLabel.text = [NSString stringWithFormat:locationFormat, listing.city, listing.state];
        locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
        locationLabel.textColor = [UIColor pm_grayDarkColor];
        locationLabel.font = [UIFont pm_futuraLightFontWithSize:13.0];
        [self.view addSubview:locationLabel];
        
        UILabel *priceLabel = [UILabel new];
        priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        priceLabel.textColor = [UIColor pm_orangeColor];
        priceLabel.text = [listing priceFormatted];
        priceLabel.font = [UIFont pm_futuraExtendedFontWithSize:25.0f];
        [self.view addSubview:priceLabel];
        
        //bottom box view
        PMManageListingBoxView *boxView = [[PMManageListingBoxView alloc] initWithFrame:CGRectZero];
        boxView.translatesAutoresizingMaskIntoConstraints = NO;
        //        [boxView.editButton addTarget:<#(id)#> action:<#(SEL)#> forControlEvents:<#(UIControlEvents)#>]
        boxView.postedDateLabel.text = @"POSTED NOV. 15";
        boxView.productImageView.image = [UIImage imageWithData:self.currentListing.picData1];
        boxView.descriptionLabel.text = self.currentListing.info;
        [self.view addSubview:boxView];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:listingLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:10.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:listingLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0f constant:80.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:listingLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:listingLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:locationLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:listingLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:locationLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:listingLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:15.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:locationLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:20.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:locationLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:listingLabel attribute:NSLayoutAttributeWidth multiplier:1.0f constant:-20.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:locationIconImageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:listingLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:locationIconImageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:locationLabel attribute:NSLayoutAttributeTop multiplier:1.0f constant:5.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:priceLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:65.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:priceLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:-15.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:priceLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:80.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:priceLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:priceLabel attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:locationLabel attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0.0f]];
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:boxView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
        
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

@end

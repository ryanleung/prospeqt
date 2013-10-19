//
//  PMAddDescriptionViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddDescriptionViewController.h"
#import "PMSingleLineFormField.h"
#import "PMAddPhotoViewController.h"

@interface PMAddDescriptionViewController () <UITextFieldDelegate>
@property (nonatomic, weak) PMSingleLineFormField *listingNameField;
@property (nonatomic, weak) PMSingleLineFormField *priceField;
@end

@implementation PMAddDescriptionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"addDescription.title", @"Add Description");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.next", @"next") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    
    PMSingleLineFormField *nameField = [PMSingleLineFormField new];
    nameField.translatesAutoresizingMaskIntoConstraints = NO;
    nameField.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    nameField.textField.placeholder = NSLocalizedString(@"addDescription.placeholder.listingName", @"Listing");
    nameField.delegate = self;
    nameField.required = YES;
    [self.scrollView addSubview:nameField];
    self.listingNameField = nameField;
    
    PMSingleLineFormField *priceField = [PMSingleLineFormField new];
    priceField.translatesAutoresizingMaskIntoConstraints = NO;
    priceField.textField.placeholder = NSLocalizedString(@"addDescription.placeholder.price", @"Price");
    priceField.delegate = self;
    priceField.required = YES;
    [self.scrollView addSubview:priceField];
    self.priceField = priceField;
    
    UILabel *nameTitleLabel = [UILabel new];
    nameTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    nameTitleLabel.font = [UIFont pm_futuraExtendedFontWithSize:20.0f];
    nameTitleLabel.textColor = [UIColor pm_grayDarkColor];
    nameTitleLabel.text = NSLocalizedString(@"addDescription.placeholder.nameTitle", @"Name Title");
    [self.scrollView addSubview:nameTitleLabel];
    
    UILabel *priceTitleLabel = [UILabel new];
    priceTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    priceTitleLabel.font = [UIFont pm_futuraExtendedFontWithSize:20.0f];
    priceTitleLabel.textColor = [UIColor pm_grayDarkColor];
    priceTitleLabel.text = NSLocalizedString(@"addDescription.placeholder.priceTitle", @"Price Title");
    [self.scrollView addSubview:priceTitleLabel];
    
    self.formFields = @[nameField, priceField];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(nameField, priceField, nameTitleLabel, priceTitleLabel);
    NSDictionary *metrics = @{ @"fieldHeight" : @60, @"topHeight" : @20.0f, @"middleHeight" : @10, @"spacer" : @6.0f };
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[nameField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[priceField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[nameTitleLabel]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[priceTitleLabel]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topHeight-[nameTitleLabel(==fieldHeight)]-spacer-[nameField(==fieldHeight)]-middleHeight-[priceTitleLabel(==fieldHeight)]-spacer-[priceField(==fieldHeight)]" options:0 metrics:metrics views:views]];
    
    [self bindLeftEdgeOfView:nameField toView:self.view];
    [self bindRightEdgeOfView:nameField toView:self.view];
    [self bindLeftEdgeOfView:priceField toView:self.view];
    [self bindRightEdgeOfView:priceField toView:self.view];
}

- (void)formAction
{
    if (![self validateSingleLineFieldsWithError:NULL]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"Error Title") message:nil delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm title") otherButtonTitles:nil];
        alertView.message = NSLocalizedString(@"addDescription.View.missingFields", @"Missing fields error message");
        [alertView show];
    } else {
        // TODO: take all of the fields and pass it on
        PMAddPhotoViewController *addPhotoViewController = [[PMAddPhotoViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:addPhotoViewController animated:YES];
    }
}

@end

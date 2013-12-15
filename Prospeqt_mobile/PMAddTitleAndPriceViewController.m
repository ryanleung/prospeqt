//
//  PMAddTitleAndPriceViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddTitleAndPriceViewController.h"
#import "PMSingleLineFormField.h"
#import "PMAddPhotoViewController.h"

@interface PMAddTitleAndPriceViewController () <UITextFieldDelegate>
@property (nonatomic, weak) PMSingleLineFormField *listingNameField;
@property (nonatomic, weak) PMSingleLineFormField *priceField;
@property (nonatomic, strong) PMTempListing *listing;
@property (nonatomic, strong) NSNumberFormatter *currencyFormatter;
@end

@implementation PMAddTitleAndPriceViewController

- (id)initWithListing:(PMTempListing *)listing
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.listing = listing;
    }
    return self;
}

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
    priceField.textField.delegate = self;
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
    priceField.textField.keyboardType = UIKeyboardTypeDecimalPad;
    priceTitleLabel.text = NSLocalizedString(@"addDescription.placeholder.priceTitle", @"Price Title");
    [self.scrollView addSubview:priceTitleLabel];
    
    UIToolbar* numberToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad)],
                           [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)],
                           nil];
    [numberToolbar sizeToFit];
    priceField.textField.inputAccessoryView = numberToolbar;
    
    self.formFields = @[nameField, priceField];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(nameField, priceField, nameTitleLabel, priceTitleLabel);
    NSDictionary *metrics = @{ @"fieldHeight" : @60, @"topHeight" : @5.0f, @"middleHeight" : @5.0, @"spacer" : @6.0f };
    
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.listingNameField.textField becomeFirstResponder];
}

- (void)formAction
{
    if (self.listingNameField.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"addDescription.error.name", @"name") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    if (self.priceField.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"addDescription.error.price", @"price") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    self.listing.price = [[NSDecimalNumber alloc] initWithString:self.priceField.textField.text];
    self.listing.title = self.listingNameField.textField.text;
    PMAddPhotoViewController *addPhotoViewController = [[PMAddPhotoViewController alloc] initWithListing:self.listing];
    [self.navigationController pushViewController:addPhotoViewController animated:YES];
}

#pragma mark - Number Pad Methods

-(void)cancelNumberPad
{
    [self.priceField.textField resignFirstResponder];
    self.priceField.textField.text = @"";
}

-(void)doneWithNumberPad
{
    [self.priceField.textField resignFirstResponder];
}

#pragma mark - Currency Formatter Helpers

- (NSNumberFormatter *)currencyFormatter
{
    if (!_currencyFormatter) {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [formatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
        [formatter setLocale:[NSLocale currentLocale]];
        _currencyFormatter = formatter;
    }
    return _currencyFormatter;
}
@end

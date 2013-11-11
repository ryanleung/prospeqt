//
//  PMAddressViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/21/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddressViewController.h"
#import "PMSingleLineFormField.h"
#import "PMButton.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface PMAddressViewController () <CLLocationManagerDelegate>
@property (nonatomic, weak) PMSingleLineFormField *streetAddressField;
@property (nonatomic, weak) PMSingleLineFormField *additionalAddressField;
@property (nonatomic, weak) PMSingleLineFormField *cityField;
@property (nonatomic, weak) PMSingleLineFormField *stateField;
@property (nonatomic, weak) PMSingleLineFormField *zipcodeField;
@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@end

@implementation PMAddressViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"address.title", @"Address");
    self.scrollView.backgroundColor = [UIColor pm_grayLightColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"address.save", @"Save")
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(formAction)];
    
    PMButton *currentLocationButton = [PMButton buttonWithType:UIButtonTypeCustom];
    currentLocationButton.translatesAutoresizingMaskIntoConstraints = NO;
    [currentLocationButton setTitle:NSLocalizedString(@"address.button.current", @"use current address") forState:UIControlStateNormal];
    [currentLocationButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [currentLocationButton addTarget:self action:@selector(useCurrentLocationButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:currentLocationButton];
    
    PMSingleLineFormField *streetAddressField = [PMSingleLineFormField new];
    streetAddressField.delegate = self;
    streetAddressField.translatesAutoresizingMaskIntoConstraints = NO;
    streetAddressField.textField.placeholder = NSLocalizedString(@"address.addressField.placeholder", @"Address field placeholder text");
    streetAddressField.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    [self.scrollView addSubview:streetAddressField];
    self.streetAddressField = streetAddressField;
    
    PMSingleLineFormField *additionalAddressField = [PMSingleLineFormField new];
    additionalAddressField.topBorderView.hidden = YES;
    additionalAddressField.delegate = self;
    additionalAddressField.translatesAutoresizingMaskIntoConstraints = NO;
    additionalAddressField.textField.placeholder = NSLocalizedString(@"address.additionalAddressField.placeholder", @"Additional address field placeholder text");
    additionalAddressField.textField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    [self.scrollView addSubview:additionalAddressField];
    self.additionalAddressField = additionalAddressField;
    
    PMSingleLineFormField *cityField = [PMSingleLineFormField new];
    cityField.topBorderView.hidden = YES;
    cityField.rightBorderView.hidden = NO;
    cityField.delegate = self;
    cityField.translatesAutoresizingMaskIntoConstraints = NO;
    cityField.textField.placeholder = NSLocalizedString(@"address.cityField.placeholder", @"City field placeholder text");
    cityField.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    [self.scrollView addSubview:cityField];
    self.cityField = cityField;
    
    PMSingleLineFormField *stateField = [PMSingleLineFormField new];
    stateField.topBorderView.hidden = YES;
    stateField.rightBorderView.hidden = NO;
    stateField.delegate = self;
    stateField.translatesAutoresizingMaskIntoConstraints = NO;
    stateField.textField.placeholder = NSLocalizedString(@"address.stateField.placeholder", @"State field placeholder text");
    stateField.textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    [self.scrollView addSubview:stateField];
    self.stateField = stateField;
    
    PMSingleLineFormField *zipcodeField = [PMSingleLineFormField new];
    zipcodeField.topBorderView.hidden = YES;
    zipcodeField.delegate = self;
    zipcodeField.translatesAutoresizingMaskIntoConstraints = NO;
    zipcodeField.textField.placeholder = NSLocalizedString(@"address.zipcodeField.placeholder", @"Zipcode field placeholder text");
    zipcodeField.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.scrollView addSubview:zipcodeField];
    self.zipcodeField = zipcodeField;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(currentLocationButton, streetAddressField, additionalAddressField, cityField, stateField, zipcodeField);
    NSDictionary *metrics = @{ @"fieldHeight" : @44, @"sectionSpacer" : @10 };
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[currentLocationButton]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-sectionSpacer-[currentLocationButton(==fieldHeight)]-sectionSpacer-[streetAddressField(==fieldHeight)][additionalAddressField(==fieldHeight)][cityField(==fieldHeight)]-|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[streetAddressField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[additionalAddressField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[cityField(==stateField)][stateField(==zipcodeField)][zipcodeField(==stateField)]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[additionalAddressField][stateField(==fieldHeight)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[additionalAddressField][zipcodeField(==fieldHeight)]" options:0 metrics:metrics views:views]];
    
    [self bindLeftEdgeOfView:currentLocationButton toView:self.view];
    [self bindRightEdgeOfView:currentLocationButton toView:self.view];
    
    self.formFields = @[self.streetAddressField, self.additionalAddressField, self.cityField, self.stateField, self.zipcodeField];
    
}

- (void)useCurrentLocationButtonPressed:(id)sender
{
    CLLocationManager *locationManager = [CLLocationManager new];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager = locationManager;
    [locationManager startUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *currentLocation = [locations lastObject];
    CLGeocoder *geoCoder = [CLGeocoder new];
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        for (CLPlacemark *placemark in placemarks) {
            self.streetAddressField.textField.text = [NSString stringWithFormat:@"%@ %@", placemark.subThoroughfare, placemark.thoroughfare];
            self.cityField.textField.text = placemark.locality;
            self.stateField.textField.text = placemark.administrativeArea;
            self.zipcodeField.textField.text = placemark.postalCode;
        }
        [manager stopUpdatingLocation];
    }];
}

#pragma mark - Form Action

- (void)formAction
{
    if (self.streetAddressField.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"address.street.error", @"error") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    if (self.cityField.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"address.street.error", @"error") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    if (self.stateField.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"address.state.error", @"error") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    if (self.zipcodeField.textField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"global.defaultErrorTitle", @"error") message:NSLocalizedString(@"address.zip.error", @"error") delegate:nil cancelButtonTitle:NSLocalizedString(@"global.confirm", @"Confirm") otherButtonTitles: nil];
        [alertView show];
        return;
    }
    
    PMAddress *address = [PMAddress new];
    address.streetAddress = self.streetAddressField.textField.text;
    address.extendedAddress = self.additionalAddressField.textField.text;
    address.city = self.cityField.textField.text;
    address.state = self.stateField.textField.text;
    address.postalCode = self.zipcodeField.textField.text;
    
    if ([self.delegate respondsToSelector:@selector(addressViewController:didCreateNewAddress:)]) {
        [self.delegate addressViewController:self didCreateNewAddress:address];
    }
}

@end

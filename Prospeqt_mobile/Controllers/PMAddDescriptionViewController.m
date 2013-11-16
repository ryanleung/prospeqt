//
//  PMAddDescriptionViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddDescriptionViewController.h"
#import "PMFinalizePostViewController.h"

@interface PMAddDescriptionViewController () <UITextViewDelegate>
@property (nonatomic, strong) UITextView *descriptionField;
@property (nonatomic, strong) PMListing *listing;
@end

@implementation PMAddDescriptionViewController

- (id)initWithListing:(PMListing *)listing
{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        self.listing = listing;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"addDescription.title", @"Add Description");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.next", @"next") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    
    UITextView *descriptionField = [UITextView new];
    descriptionField.translatesAutoresizingMaskIntoConstraints = NO;
    descriptionField.autocapitalizationType = UITextAutocapitalizationTypeSentences;
    descriptionField.font = [UIFont pm_futuraLightFontWithSize:20.0f];
    descriptionField.textColor = [UIColor pm_grayDarkColor];
//    descriptionField.text = NSLocalizedString(@"addDescription.placeholder.description", @"Description");
    descriptionField.delegate = self;
    [self.scrollView addSubview:descriptionField];
    self.descriptionField = descriptionField;
    self.activeField = self.descriptionField;
    
    UILabel *describeTitleLabel = [UILabel new];
    describeTitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    describeTitleLabel.font = [UIFont pm_futuraExtendedFontWithSize:20.0f];
    describeTitleLabel.textColor = [UIColor pm_grayDarkColor];
    describeTitleLabel.text = NSLocalizedString(@"addDescription.placeholder.descriptionTitle", @"Name Title");
    [self.scrollView addSubview:describeTitleLabel];
    
    self.formFields = @[descriptionField];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(descriptionField, describeTitleLabel);
    NSDictionary *metrics = @{ @"titleHeight" : @30, @"fieldHeight" : @300, @"topHeight" : @20.0f, @"middleHeight" : @10, @"spacer" : @6.0f };
    
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[descriptionField]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[describeTitleLabel]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topHeight-[describeTitleLabel(==titleHeight)]-spacer-[descriptionField(==fieldHeight)]" options:0 metrics:metrics views:views]];

    [self bindLeftEdgeOfView:descriptionField toView:self.view];
    [self bindRightEdgeOfView:descriptionField toView:self.view];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.descriptionField becomeFirstResponder];
}

- (void)formAction
{
    self.listing.info = self.descriptionField.text;
    PMFinalizePostViewController *finalizePostViewController = [[PMFinalizePostViewController alloc] initWithListing:self.listing];
    [self.navigationController pushViewController:finalizePostViewController animated:YES];
}

@end

//
//  PMProfileViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/14/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <RestKit/UIImageView+AFNetworking.h>
#import "PMLocationAccessoryLabelView.h"
#import "PMReviewsAccessoryLabelView.h"
#import "PMAddress.h"
#import "PMEditProfileViewController.h"

static CGSize const kPMAvatarSize = (CGSize) { 160.0f, 160.0f };

@interface PMProfileViewController ()
@property (nonatomic, strong) UIView *smallSeparatorTopView;
@property (nonatomic, strong) UIView *smallSeparatorBottomView;
@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, strong) UIView *avatarBorderView;
@property (nonatomic, strong) PMReviewsAccessoryLabelView *reviewsLabel;
@property (nonatomic, strong) PMLocationAccessoryLabelView *locationLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation PMProfileViewController

@synthesize address = _address;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.profile.title", @"Profile");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.profile.title", @"Profile") image:[[UIImage imageNamed:@"Profile_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Profile_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.edit", @"edit") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.avatarImageView];
    [self.scrollView addSubview:self.descriptionView];
    [self.scrollView addSubview:self.separatorView];
    [self.scrollView addSubview:self.smallSeparatorTopView];
    [self.scrollView addSubview:self.smallSeparatorBottomView];
    [self.scrollView addSubview:self.reviewsLabel];
    [self.scrollView addSubview:self.locationLabel];
    
    [self setupLayoutConstraints];
    
    // TODO: FOR TESTING PURPOSES
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.frame = self.avatarImageView.bounds;
    [self.avatarImageView addSubview:indicatorView];
    [indicatorView startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.outsidethebeltway.com/wp-content/uploads/2010/01/conan-obrien.jpg"]]];
        dispatch_async((dispatch_get_main_queue()), ^{
            self.avatarImageView.alpha = 0.0f;
            [UIView animateWithDuration:0.5 animations:^{
                self.avatarImageView.image = image;
                self.avatarImageView.alpha = 1.0f;
            } completion:nil];
            [indicatorView stopAnimating];
        });
    });
    self.descriptionView.text = @"\nHi, I'm Conan Christopher O'Brien. I'm originally from Brookline, MA. Right now, I'm going through a move and have a lot of things here and there that I'd liek to sell-which brings me here. I'm a nice guy, promise!";
    self.percentPositiveReviews = 95;
    PMAddress *address = [PMAddress new];
    address.locality = @"Davis";
    address.region = @"CA";
    self.address = address;
}

- (NSDictionary *)viewBindings
{
    return NSDictionaryOfVariableBindings(_avatarImageView, _descriptionView, _separatorView, _smallSeparatorTopView, _smallSeparatorBottomView, _reviewsLabel, _locationLabel, _scrollView);
}

- (NSDictionary *)viewMetrics
{
    return @{
           @"topSpacing"        : @20,
           @"middleSpacing"     : @20,
           @"separatorSpacing"  : @2,
           @"borderSize"        : @160,
           @"separatorWidth"    : @200,
           @"viewWidth"         : @150,
           @"viewHeight"        : @20,
           @"descriptionHeight" : @300,
           };
}

- (void)setupLayoutConstraints
{
    NSDictionary *views = [self viewBindings];
    NSDictionary *metrics = [self viewMetrics];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_scrollView]|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_scrollView]|" options:0 metrics:nil views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpacing-[_avatarImageView]-middleSpacing-[_reviewsLabel(==viewHeight)]-middleSpacing-[_smallSeparatorTopView(==0.5)]-separatorSpacing-[_smallSeparatorBottomView(==0.5)]-middleSpacing-[_locationLabel(==viewHeight)]-middleSpacing-[_separatorView(==0.5)][_descriptionView(==descriptionHeight)]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_reviewsLabel(==viewWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_smallSeparatorTopView(==separatorWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_smallSeparatorBottomView(==separatorWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_locationLabel(==viewWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_descriptionView]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_separatorView]|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_descriptionView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_reviewsLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_locationLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_smallSeparatorBottomView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:_smallSeparatorTopView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
}

#pragma mark - Property Helpers

- (UIView *)createSeparatorView
{
    UIView *separatorView = [UIView new];
    separatorView.translatesAutoresizingMaskIntoConstraints = NO;
    separatorView.layer.zPosition = CGFLOAT_MAX;
    separatorView.backgroundColor = [UIColor pm_grayDarkColor];
    
    return separatorView;
}

#pragma mark - Actions

- (void)formAction
{
    PMEditProfileViewController *editProfileViewController = [[PMEditProfileViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:editProfileViewController animated:YES];
}

#pragma mark - Properties

- (UIImageView *)avatarImageView
{
    if (!_avatarImageView) {
        CGRect avatarRect = (CGRect){ CGPointZero, kPMAvatarSize };
        
        UIImage *maskImage = [UIImage imageNamed:@"ProfilePic_Circle_Mask"];
        CALayer *maskLayer = [CALayer layer];
        maskLayer.contents = (id)maskImage.CGImage;
        maskLayer.frame = avatarRect;
        
        _avatarImageView = [[UIImageView alloc] initWithFrame:avatarRect];
        _avatarImageView.translatesAutoresizingMaskIntoConstraints = NO;
        _avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
        _avatarImageView.layer.mask = maskLayer;
        
        [_avatarImageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_avatarImageView(==avatarWidth)]" options:0 metrics:@{@"avatarWidth": @(kPMAvatarSize.width)} views:NSDictionaryOfVariableBindings(_avatarImageView)]];
        [_avatarImageView addConstraint:[NSLayoutConstraint constraintWithItem:_avatarImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:_avatarImageView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
    }
    return _avatarImageView;
}

- (UITextView *)descriptionView
{
    if (!_descriptionView) {
        _descriptionView = [UITextView new];
        _descriptionView.translatesAutoresizingMaskIntoConstraints = NO;
        _descriptionView.font = [UIFont pm_futuraLightFontWithSize:18.0f];
        _descriptionView.textColor = [UIColor pm_grayDarkColor];
        _descriptionView.editable = NO;
        _descriptionView.textAlignment = NSTextAlignmentCenter;
    }
    return _descriptionView;
}

- (UIView *)separatorView
{
    if (!_separatorView) {
        _separatorView = [self createSeparatorView];
    }
    return _separatorView;
}

- (UIView *)smallSeparatorBottomView
{
    if (!_smallSeparatorBottomView) {
        _smallSeparatorBottomView = [self createSeparatorView];
    }
    return _smallSeparatorBottomView;
}

- (UIView *)smallSeparatorTopView
{
    if (!_smallSeparatorTopView) {
        _smallSeparatorTopView = [self createSeparatorView];
    }
    return _smallSeparatorTopView;
}

- (PMReviewsAccessoryLabelView *)reviewsLabel
{
    if (!_reviewsLabel) {
        _reviewsLabel = [PMReviewsAccessoryLabelView new];
        _reviewsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _reviewsLabel;
}

- (PMLocationAccessoryLabelView *)locationLabel
{
    if (!_locationLabel) {
        _locationLabel = [PMLocationAccessoryLabelView new];
        _locationLabel.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _locationLabel;
}

- (PMAddress *)address
{
    if (!_address) {
        _address = [PMAddress new];
    }
    return _address;
}

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        _scrollView.translatesAutoresizingMaskIntoConstraints = NO;
        _scrollView.scrollEnabled = YES;
        _scrollView.alwaysBounceVertical = YES;
    }
    return _scrollView;
}
- (void)setPercentPositiveReviews:(int)percentPositiveReviews
{
    _percentPositiveReviews = percentPositiveReviews;
    [self.reviewsLabel setRatings:_percentPositiveReviews];
}

- (void)setAddress:(PMAddress *)address
{
    _address = address;
    [self.locationLabel setLocationWithCity:address.locality State:address.region];
}
@end

//
//  PMAuthViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 9/15/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAuthViewController.h"
#import "PMSignInViewController.h"
#import "PMSignUpViewController.h"
#import "SMPageControl.h"

static const CGRect kPMScrollViewRect = (CGRect) { { 0.0f, 0.0f }, { 320.0f, 382.0f } };
static const CGRect kPMScrollView568hRect = (CGRect) { { 0.0f, 0.0f }, { 320.0f, 470.0f } };
static const CGRect kPMPageControlRect = (CGRect) { { 0.0f, 0.0f }, { 320.0f, 10.0f } };
static UIEdgeInsets const kPMTutorialPageInsets = (UIEdgeInsets) { 0.0f, 0.0f, 0.0f, 0.0f };
static const CGFloat kPMTutorialTopInsetSmallScreen = 0.0f;

static const NSInteger kPMTutorialPageCount = 5;
static const CGFloat kPMButtonPadding = 8.0f;
static const CGFloat kPMPageControlPadding = 14.0f;
static NSString * const kPMTutorialImageBaseName = @"Page";

@interface PMAuthViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) SMPageControl *pageControl;
@end

@implementation PMAuthViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        CGFloat topPagePadding = kPMTutorialTopInsetSmallScreen;
        
        // setup scroll view
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:kPMScrollViewRect];
        if (IS_568H_SCREEN) {
            scrollView.frame = kPMScrollView568hRect;
            topPagePadding = kPMTutorialPageInsets.top;
        }
        self.view.backgroundColor = [UIColor pm_splashBackgroundColor];
        
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:scrollView];
        self.scrollView = scrollView;
        
        for (int i = 0; i < kPMTutorialPageCount; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@%d", kPMTutorialImageBaseName, i + 1];
            UIImageView *tutorialPage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
            int originX = (CGRectGetWidth(self.scrollView.bounds) * i) + kPMTutorialPageInsets.left;
            tutorialPage.frame = (CGRect) { originX, topPagePadding, tutorialPage.bounds.size };
            [self.scrollView addSubview:tutorialPage];
        }
        [self.scrollView setContentSize:(CGSize) {
            CGRectGetWidth(self.scrollView.bounds) * kPMTutorialPageCount,
            CGRectGetMidY(self.scrollView.bounds) // Force content height to be half the height of the scroll view
        }];
        
        SMPageControl *pageControl = [[SMPageControl alloc] initWithFrame:(CGRect) { { 0.0f, kPMPageControlPadding + CGRectGetMaxY(self.scrollView.frame)}, kPMPageControlRect.size }]; // must init with frame, library does internal initialization
        [pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        pageControl.indicatorMargin = 8.0f;
        pageControl.numberOfPages = kPMTutorialPageCount;
        pageControl.pageIndicatorTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        pageControl.currentPageIndicatorTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        
        UIButton *signInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [signInButton setTitle:NSLocalizedString(@"auth.signin", @"Sign In") forState:UIControlStateNormal];
        [signInButton addTarget:self action:@selector(didTapSignInButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [signUpButton setTitle:NSLocalizedString(@"auth.signup", @"Sign up") forState:UIControlStateNormal];
        [signUpButton addTarget:self action:@selector(didTapSignUpButton:) forControlEvents:UIControlEventTouchUpInside];
        
        UIImageView *horizontalDivider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"walkthrough-horz-divider"]];
        UIImageView *verticalDivider1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"walkthrough-vert-divider"]];
        UIImageView *verticalDivider2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"walkthrough-vert-divider"]];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(pageControl, signInButton, signUpButton, horizontalDivider, verticalDivider1, verticalDivider2);
        for (UIView *view in views.allValues) {
            view.translatesAutoresizingMaskIntoConstraints = NO;
            [self.view addSubview:view];
        }
        
        NSDictionary *metrics = @{
                                  @"edgeInset" : @8,
                                  @"dividerWidth" : @1,
                                  @"dividerHeight" : @30,
                                  @"buttonWidthSmall" : @160,
                                  @"pageControlHeight" : @12, // SMPageControl needs to support autolayout, intrinsic size not implemented
                                  @"pageToDividerOffset" : IS_568H_SCREEN ? @17 : @3,
                                  @"pgaeToFacebookOffset" : IS_568H_SCREEN ? @33 : @19
                                  };
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[pageControl]-|" options:0 metrics:metrics views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-edgeInset-[horizontalDivider]-edgeInset-|" options:0 metrics:metrics views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[signInButton(==buttonWidthSmall)][verticalDivider1(==dividerWidth)][signUpButton(==buttonWidthSmall)]|" options:NSLayoutFormatAlignAllCenterY metrics:metrics views:views]];
        
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[pageControl(==pageControlHeight)]" options:0 metrics:metrics views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[pageControl]-pageToDividerOffset-[horizontalDivider]-edgeInset-[signInButton]-|" options:0 metrics:metrics views:views]];
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[verticalDivider1(==dividerHeight)]" options:0 metrics:metrics views:views]];
        
        self.pageControl = pageControl;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didTapSignInButton:(id)sender
{
    PMSignInViewController *signInViewController = [[PMSignInViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:signInViewController animated:YES];
}

- (void)didTapSignUpButton:(id)sender
{
    PMSignUpViewController *signUpViewController = [[PMSignUpViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:signUpViewController animated:YES];
}

#pragma mark - Scrolling/Paging

- (void)changePage:(id)sender
{
    NSInteger page = self.pageControl.currentPage;
    
    // update the scroll view to the appropriate page
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(bounds) * page;
    bounds.origin.y = 0;
    [self.scrollView scrollRectToVisible:bounds animated:YES];
}

#pragma mark ScrollView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // switch the indicator when more than 50% of the previous/next page is visible
    CGFloat pageWidth = CGRectGetWidth(self.scrollView.bounds);
    NSUInteger page = floor((self.scrollView.contentOffset.x - pageWidth / 2.0f) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}


@end

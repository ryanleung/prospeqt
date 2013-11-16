//
//  PMAddPhotoViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddPhotoViewController.h"
#import "UIImage+PMColor.h"
#import <RestKit/UIImageView+AFNetworking.h>
#import <QuartzCore/QuartzCore.h>
#import "PMAddDescriptionViewController.h"

static const CGFloat kPMBorderWidth = 5.0f;

typedef NS_ENUM(NSUInteger, PMPhotoTag) {
    PMPhotoTagTopLeft = 0,
    PMPhotoTagTopRight,
    PMPhotoTagBottomLeft,
    PMPhotoTagBottomRight,
    PMPhotoTagCount
};

@interface PMAddPhotoViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImageView *cameraTopLeftImageView;
@property (nonatomic, strong) UIImageView *cameraTopRightImageView;
@property (nonatomic, strong) UIImageView *cameraBottomLeftImageView;
@property (nonatomic, strong) UIImageView *cameraBottomRightImageView;
@property (nonatomic, strong) PMListing *listing;
@property (nonatomic, strong) NSMutableArray *takenPictures;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation PMAddPhotoViewController

- (id)initWithListing:(PMListing *)listing
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.listing = listing;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"addPhoto.title", @"Listings");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.next", @"next") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    
    UIImageView *camImageViewTL = [self createCamImageView];
    camImageViewTL.tag = PMPhotoTagTopLeft;
    [self.scrollView addSubview:camImageViewTL];
    self.cameraTopLeftImageView = camImageViewTL;
    
    UIImageView *camImageViewTR = [self createCamImageView];
    camImageViewTR.tag = PMPhotoTagTopRight;
    [self.scrollView addSubview:camImageViewTR];
    self.cameraTopRightImageView = camImageViewTR;
    
    UIImageView *camImageViewBR = [self createCamImageView];
    camImageViewBR.tag = PMPhotoTagBottomRight;
    [self.scrollView addSubview:camImageViewBR];
    self.cameraBottomRightImageView =  camImageViewBR;
    
    UIImageView *camImageViewBL = [self createCamImageView];
    camImageViewBL.tag = PMPhotoTagBottomLeft;
    [self.scrollView addSubview:camImageViewBL];
    self.cameraBottomLeftImageView = camImageViewBL;
    
    UIActivityIndicatorView *activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.scrollView addSubview:activityIndicatorView];
    self.activityIndicatorView = activityIndicatorView;
    self.activityIndicatorView.hidden = NO;
    self.activityIndicatorView.hidesWhenStopped = YES;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(camImageViewTL, camImageViewTR, camImageViewBL, camImageViewBR, activityIndicatorView);
    NSDictionary *metrics = @{ @"outsideSpacer" : @10, @"middleSpacer" : @10, @"imageWidth" : @140, @"toBottomSpacer" : @300 };
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-outsideSpacer-[camImageViewTL(==imageWidth)]-[camImageViewTR(==imageWidth)]-outsideSpacer-|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-outsideSpacer-[camImageViewBL(==imageWidth)]-[camImageViewBR(==imageWidth)]-outsideSpacer-|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-outsideSpacer-[camImageViewTL(==imageWidth)]-middleSpacer-[camImageViewBL(==imageWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-outsideSpacer-[camImageViewTR(==imageWidth)]-middleSpacer-[camImageViewBR(==imageWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-toBottomSpacer-[activityIndicatorView(==imageWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicatorView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0.0f]];
    [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:activityIndicatorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:activityIndicatorView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
}

#pragma mark - Camera helpers

- (UIImageView *)createCamImageView
{
    UIImageView *camImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CameraBox"] highlightedImage:[[UIImage imageNamed:@"CameraBox"] imageByApplyingAlpha:0.2f]];
    camImageView.translatesAutoresizingMaskIntoConstraints = NO;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(camImageViewClicked:)];
    [camImageView addGestureRecognizer:tap];
    camImageView.userInteractionEnabled = YES;
    return camImageView;
}

- (void)camImageViewClicked:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.view.tag = ((UIGestureRecognizer *)sender).view.tag;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
    imagePickerController.cameraViewTransform = CGAffineTransformMakeScale(1.0, 0.8);
    [self presentViewController:imagePickerController animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    UIImage *pickedImage =  [info objectForKey:UIImagePickerControllerOriginalImage];
    switch (picker.view.tag) {
        case PMPhotoTagTopLeft:
            [self.cameraTopLeftImageView setImage:pickedImage];
            [self.cameraTopLeftImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
            [self.cameraTopLeftImageView.layer setBorderWidth:kPMBorderWidth];
            break;
        case PMPhotoTagTopRight:
            [self.cameraTopRightImageView setImage:pickedImage];
            [self.cameraTopRightImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
            [self.cameraTopRightImageView.layer setBorderWidth:kPMBorderWidth];
            break;
        case PMPhotoTagBottomLeft:
            [self.cameraBottomLeftImageView setImage:pickedImage];
            [self.cameraBottomLeftImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
            [self.cameraBottomLeftImageView.layer setBorderWidth:kPMBorderWidth];
            break;
        case PMPhotoTagBottomRight:
            [self.cameraBottomRightImageView setImage:pickedImage];
            [self.cameraBottomRightImageView.layer setBorderColor:[[UIColor whiteColor] CGColor]];
            [self.cameraBottomRightImageView.layer setBorderWidth:kPMBorderWidth];
            break;
        default:
            break;
    }
    [self.takenPictures addObject:pickedImage];
}

- (void)formAction
{
    [self.activityIndicatorView startAnimating];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        int imageIndex = 1;
        for (UIImage *image in self.takenPictures) {
            if (image) {
                NSString *listingImage = [NSString stringWithFormat:@"picData%i", imageIndex];
                [self.listing setValue:UIImageJPEGRepresentation(image, .9) forKey:listingImage];
                imageIndex++;
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicatorView stopAnimating];
            PMAddDescriptionViewController *addDescriptionViewController = [[PMAddDescriptionViewController alloc] initWithListing:self.listing];
            [self.navigationController pushViewController:addDescriptionViewController animated:YES];
        });
    });
}

#pragma mark - Properties

- (NSMutableArray *)takenPictures
{
    if (!_takenPictures) {
        _takenPictures = [[NSMutableArray alloc] init];
    }
    return _takenPictures;
}

@end

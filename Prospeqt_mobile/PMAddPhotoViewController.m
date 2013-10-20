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
@end

@implementation PMAddPhotoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"addPhoto.title", @"Listings");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.next", @"next") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
    
    UIImageView *camImageViewTL = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CameraBox"] highlightedImage:[[UIImage imageNamed:@"CameraBox"] imageByApplyingAlpha:0.2f]];
    camImageViewTL.translatesAutoresizingMaskIntoConstraints = NO;
    UITapGestureRecognizer *tapTL = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(camImageViewClicked:)];
    [camImageViewTL addGestureRecognizer:tapTL];
    camImageViewTL.userInteractionEnabled = YES;
    camImageViewTL.tag = PMPhotoTagTopLeft;
    [self.scrollView addSubview:camImageViewTL];
    self.cameraTopLeftImageView = camImageViewTL;
    
    UIImageView *camImageViewTR = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CameraBox"] highlightedImage:[[UIImage imageNamed:@"CameraBox"] imageByApplyingAlpha:0.2f]];
    camImageViewTR.translatesAutoresizingMaskIntoConstraints = NO;
    UITapGestureRecognizer *tapTR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(camImageViewClicked:)];
    [camImageViewTR addGestureRecognizer:tapTR];
    camImageViewTR.userInteractionEnabled = YES;
    camImageViewTR.tag = PMPhotoTagTopRight;
    [self.scrollView addSubview:camImageViewTR];
    self.cameraTopRightImageView = camImageViewTR;
    
    UIImageView *camImageViewBR = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CameraBox"] highlightedImage:[[UIImage imageNamed:@"CameraBox"] imageByApplyingAlpha:0.2f]];
    camImageViewBR.translatesAutoresizingMaskIntoConstraints = NO;
    UITapGestureRecognizer *tapBR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(camImageViewClicked:)];
    [camImageViewBR addGestureRecognizer:tapBR];
    camImageViewBR.userInteractionEnabled = YES;
    camImageViewBR.tag = PMPhotoTagBottomRight;
    [self.scrollView addSubview:camImageViewBR];
    self.cameraBottomRightImageView =  camImageViewBR;
    
    UIImageView *camImageViewBL = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CameraBox"] highlightedImage:[[UIImage imageNamed:@"CameraBox"] imageByApplyingAlpha:0.2f]];
    camImageViewBL.translatesAutoresizingMaskIntoConstraints = NO;
    UITapGestureRecognizer *tapBL = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(camImageViewClicked:)];
    [camImageViewBL addGestureRecognizer:tapBL];
    camImageViewBL.userInteractionEnabled = YES;
    camImageViewBL.tag = PMPhotoTagBottomLeft;
    [self.scrollView addSubview:camImageViewBL];
    self.cameraBottomLeftImageView = camImageViewBL;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(camImageViewTL, camImageViewTR, camImageViewBL, camImageViewBR);
    NSDictionary *metrics = @{ @"outsideSpacer" : @10, @"middleSpacer" : @10, @"imageWidth" : @140 };
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-outsideSpacer-[camImageViewTL(==imageWidth)]-[camImageViewTR(==imageWidth)]-outsideSpacer-|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-outsideSpacer-[camImageViewBL(==imageWidth)]-[camImageViewBR(==imageWidth)]-outsideSpacer-|" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-outsideSpacer-[camImageViewTL(==imageWidth)]-middleSpacer-[camImageViewBL(==imageWidth)]" options:0 metrics:metrics views:views]];
    [self.scrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-outsideSpacer-[camImageViewTR(==imageWidth)]-middleSpacer-[camImageViewBR(==imageWidth)]" options:0 metrics:metrics views:views]];
}

- (void)camImageViewClicked:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.view.tag = ((UIGestureRecognizer *)sender).view.tag;
    imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePickerController.delegate = self;
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
}

- (void)formAction
{
    // TODO: take all of the fields and pass it on
    PMAddDescriptionViewController *addDescriptionViewController = [[PMAddDescriptionViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:addDescriptionViewController animated:YES];
}

@end

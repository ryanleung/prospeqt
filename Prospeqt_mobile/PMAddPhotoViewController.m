//
//  PMAddPhotoViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/5/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddPhotoViewController.h"

@interface PMAddPhotoViewController ()

@end

@implementation PMAddPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"addPhoto.title", @"Listings");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    [self presentViewController:imagePickerController animated:YES completion:nil];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

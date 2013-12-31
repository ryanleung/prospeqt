//
//  PMEditProfileViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/28/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMEditProfileViewController.h"
#import "PMTextFieldCell.h"
#import "PMDiscloseIndicatorCell.h"
#import "PMCell.h"
#import "UIImage+PMColor.h"

typedef NS_ENUM(NSUInteger, PMCellType) {
    PMCellTypeFirstName = 0,
    PMCellTypeLastName,
    PMCellTypeLocation,
    PMCellTypeEmptySpaceOne,
    PMCellTypeTakeNewPhoto,
    PMCellTypeChooseFromLibrary,
    PMCellTypeEmptySpaceTwo,
    PMCellTypeEditBio,
    PMCellTypeEditSocialProfiles,
    PMCellCount
};

static const CGFloat kPMMiscCellHeight = 30.0f;
static const CGFloat kPMOptionCellHeight = 45.0f;
static NSString * const kTextFieldCellIdentifier = @"textFieldCellIdentifier";
static NSString * const kDisclosureCellIdentifier = @"disclosureCellIdentifier";
static NSString * const kMiscCellIdentifier = @"miscCellIdentifier";

@interface PMEditProfileViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) NSString *avatarDataString;
@property (nonatomic, strong) PMUser *user;
@end

@implementation PMEditProfileViewController

- (id)initWithUser:(PMUser *)user
{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = NSLocalizedString(@"profile.edit.title", @"Edit Profile");
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"global.save", @"save") style:UIBarButtonItemStylePlain target:self action:@selector(formAction)];
   
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.scrollEnabled = YES;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource  = self;
    [tableView registerClass:[PMTextFieldCell class] forCellReuseIdentifier:kTextFieldCellIdentifier];
    [tableView registerClass:[PMCell class] forCellReuseIdentifier:kMiscCellIdentifier];
    [tableView registerClass:[PMDiscloseIndicatorCell class] forCellReuseIdentifier:kDisclosureCellIdentifier];
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}

#pragma mark UITableViewDelegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return PMCellCount;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // hide separator view of cell above.
    
    PMCell *cell = (PMCell *)[ self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
    switch (indexPath.row) {
        case PMCellTypeFirstName:
            cell.separatorVisible = YES;
            break;
        default:
            cell.separatorVisible = NO;
            break;
        }
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    // show separator view of cell above.
    if (indexPath.row != 0) {
        PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
        if (cell) {
            cell.separatorVisible = YES;
        } else {
            // If the cell can't be found brute-force the cell separator flag. This can occur if the user scrolls the table view while a cell is highlighted. In this case the unhighlighted indexPath is INT_MAX. This is specifically an iOS 6 issue that is resolved in iOS 7.
            for (PMCell *itemCell in [self.tableView visibleCells]) {
                itemCell.separatorVisible = YES;
            }
        }
    }
}

- (PMCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = nil;
    switch (indexPath.row) {
        case PMCellTypeFirstName:
        case PMCellTypeLastName:
        case PMCellTypeLocation:
            cell = [tableView dequeueReusableCellWithIdentifier:kTextFieldCellIdentifier];
            break;
        case PMCellTypeEmptySpaceOne:
        case PMCellTypeEmptySpaceTwo:
            cell = [tableView dequeueReusableCellWithIdentifier:kMiscCellIdentifier];
            break;
        case PMCellTypeTakeNewPhoto:
        case PMCellTypeChooseFromLibrary:
        case PMCellTypeEditBio:
        case PMCellTypeEditSocialProfiles:
            cell = [tableView dequeueReusableCellWithIdentifier:kDisclosureCellIdentifier];
            break;
        default:
            break;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(PMCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCellTypeFirstName:
            ((PMTextFieldCell *)cell).textField.placeholder = NSLocalizedString(@"profile.placeholder.first", @"placeholder");
            if (self.user.firstName != nil) {
                ((PMTextFieldCell *)cell).textField.text = self.user.firstName;
            }
            break;
        case PMCellTypeLastName:
            ((PMTextFieldCell *)cell).textField.placeholder = NSLocalizedString(@"profile.placeholder.last", @"placeholder");
            if (self.user.lastName != nil) {
                ((PMTextFieldCell *)cell).textField.text = self.user.lastName;
            }
            break;
        case PMCellTypeLocation:
            ((PMTextFieldCell *)cell).textField.placeholder = NSLocalizedString(@"profile.placeholder.location", @"placeholder");
            if (self.user.location != nil) {
                ((PMTextFieldCell *)cell).textField.text = self.user.location;
            }
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeEmptySpaceOne:
            cell.backgroundColor = [UIColor pm_grayLightColor];
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeTakeNewPhoto:
            cell.textLabel.text = NSLocalizedString(@"profile.placeholder.takePhoto", @"placeholder");
            break;
        case PMCellTypeChooseFromLibrary:
            cell.textLabel.text = NSLocalizedString(@"profile.placeholder.chooseFromLibrary", @"placeholder");
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeEmptySpaceTwo:
            cell.backgroundColor = [UIColor pm_grayLightColor];
            [cell useLastItemSeparator:YES];
            break;
        case PMCellTypeEditBio:
            cell.textLabel.text = NSLocalizedString(@"profile.edit.bio", @"placeholder");
            break;
        case PMCellTypeEditSocialProfiles:
            cell.textLabel.text = NSLocalizedString(@"profile.edit.social", @"placeholder");
            [cell useLastItemSeparator:YES];
            break;
        default:
            break;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCellTypeTakeNewPhoto: {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.delegate = self;
            //            imagePickerController.cameraViewTransform = CGAffineTransformMakeScale(1.0, 0.8);
            [self presentViewController:imagePickerController animated:YES completion:NULL];
            break;
        }
        case PMCellTypeChooseFromLibrary: {
            UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
            imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePickerController.allowsEditing = YES;
            imagePickerController.delegate = self;
            [self presentViewController:imagePickerController animated:YES completion:NULL];
            break;
        }
        default:
            break;
    }
}

- (NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMCell *cell = (PMCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]];
    cell.highlighted = NO;
    return indexPath;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case PMCellTypeEmptySpaceOne:
        case PMCellTypeEmptySpaceTwo:
            return kPMMiscCellHeight;
            break;
        default:
            return kPMOptionCellHeight;
            break;
    }
}

#pragma mark - UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:nil];
    // start animating hud
    UIImage *pickedImage =  [info objectForKey:UIImagePickerControllerOriginalImage];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [UIImage compressImage:[UIImage imageWithImage:pickedImage scaledToSize:CGSizeMake(100, 100)]];
        self.avatarDataString = [imageData base64EncodedStringWithOptions:0];
        dispatch_async(dispatch_get_main_queue(), ^{
            // stop animating
        });
    });
}

#pragma mark - Form Actions

- (void)formAction
{
    NSString *firstNameFormValue = ((PMTextFieldCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:PMCellTypeFirstName inSection:0]]).textField.text;
    NSString *lastNameFormValue = ((PMTextFieldCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:PMCellTypeLastName inSection:0]]).textField.text;
    NSString *locationFormValue = ((PMTextFieldCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:PMCellTypeLocation inSection:0]]).textField.text;
    
    self.user.firstName = firstNameFormValue;
    self.user.lastName = lastNameFormValue;
    self.user.location = locationFormValue;
    
    if (self.avatarDataString != nil) {
        self.user.avatarDataString = self.avatarDataString;
    }
    
    [self.networkController editProfileWithUserInfo:self.user completion:^(id response, NSError *error) {
        if (!error) {
            if ([self.delegate respondsToSelector:@selector(profileDidEndEditingWithSave)]) {
                [self.delegate profileDidEndEditingWithSave];
            }
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

@end

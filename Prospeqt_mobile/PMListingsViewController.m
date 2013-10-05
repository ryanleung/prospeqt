//
//  PMListingsViewController.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/2/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMListingsViewController.h"
#import "PMListingCell.h"

static NSString * const kListingCellIdentifier = @"listingCellIdentifier";

@interface PMListingsViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation PMListingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"tabbar.listings.title", @"Listings");
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:NSLocalizedString(@"tabbar.listings.title", @"Listings") image:[[UIImage imageNamed:@"Listings_Icon_Inactive"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Listings_Icon_active"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        tableView.delegate = self;
        tableView.dataSource  = self;
        [tableView registerClass:[PMListingCell class] forCellReuseIdentifier:kListingCellIdentifier];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.scrollEnabled = YES;
        [self.view addSubview:tableView];
        self.tableView = tableView;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate/Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

//- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // hide separator view of cell above.
//    LUVListItemCell *cell = (LUVListItemCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
//    switch (indexPath.row) {
//        case LUVCheckoutCellTypeInfoTitle:
//        case LUVCheckoutCellTypeOrderTitle:
//        case LUVCheckoutCellTypeProduct:
//        case LUVCheckoutCellTypeSubtotal:
//        case LUVCheckoutCellTypeShipTax:
//        case LUVCheckoutCellTypeTotal:
//        case LUVCheckoutCellTypeVariant:
//            cell.separatorVisible = YES;
//            break;
//        default:
//            cell.separatorVisible = NO;
//            break;
//    }
//}
//
//- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // show separator view of cell above.
//    if (indexPath.row != 0) {
//        LUVListItemCell *cell = (LUVListItemCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row - 1 inSection:indexPath.section]];
//        if (cell) {
//            cell.separatorVisible = YES;
//        } else {
//            // If the cell can't be found brute-force the cell separator flag. This can occur if the user scrolls the table view while a cell is highlighted. In this case the unhighlighted indexPath is INT_MAX. This is specifically an iOS 6 issue that is resolved in iOS 7.
//            for (LUVListItemCell *itemCell in [self.tableView visibleCells]) {
//                itemCell.separatorVisible = YES;
//            }
//        }
//    }
//}

- (PMListingCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PMListingCell *cell = [tableView dequeueReusableCellWithIdentifier:kListingCellIdentifier];
    return cell;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(LUVListItemCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    switch (indexPath.row) {
//        case LUVCheckoutCellTypeInfoTitle:
//            ((LUVCheckoutTitleCell *)cell).titleLabel.text = NSLocalizedString(@"purchasing.receipt.information", @"Information Title");
//            [cell useLastItemSeparator:YES];
//            break;
//        case LUVCheckoutCellTypeShippingAddress:
//            if (self.checkout.address) {
//                [(LUVCheckoutShippingCreditCell *)cell updateWithAddress:self.checkout.address];
//            } else {
//                cell.textLabel.text = NSLocalizedString(@"purchasing.address.title", @"Add Shipping Address");
//            }
//            [cell useLastItemSeparator:NO];
//            break;
//        case LUVCheckoutCellTypeBillingInfo:
//            if (self.checkout.creditCard) {
//                [(LUVCheckoutShippingCreditCell *)cell updateWithCheckout:self.checkout];
//            } else {
//                cell.textLabel.text = NSLocalizedString(@"purchasing.billing.title", @"Add Credit Card");
//            }
//            [cell useLastItemSeparator:YES];
//            break;
//        case LUVCheckoutCellTypeOrderTitle:
//            ((LUVCheckoutTitleCell *)cell).titleLabel.text = NSLocalizedString(@"purchasing.receipt.title", @"Order Title");
//            [cell useLastItemSeparator:YES];
//            break;
//        case LUVCheckoutCellTypeProduct: {
//            __weak LUVListItemCell *weak_cell = cell;
//            [(LUVCheckoutProductCell *)cell updateWithRecommendation:self.recommendation variant:self.variant];
//            UIImageView *placeholder = [[UIImageView alloc] initWithFrame:(CGRect) {{ 0.0f, 0.0f }, { 40.0f, 40.0f}}];
//            [cell.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.recommendation.imageUrl]] placeholderImage:placeholder.image success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
//                weak_cell.imageView.image = image;
//                [weak_cell setNeedsLayout];
//                weak_cell.separatorView.layer.zPosition = MAXFLOAT;
//            } failure:nil];
//            [cell useLastItemSeparator:NO];
//            break;
//        }
//        case LUVCheckoutCellTypeVariant:
//            [(LUVCheckoutOrderFieldCell *)cell updateVariantWithVariant:self.variant checkout:self.checkout selectable:YES];
//            [cell useLastItemSeparator:NO];
//            break;
//        case LUVCheckoutCellTypeSubtotal:
//            [(LUVCheckoutOrderFieldCell *)cell updateSubTotalWithRecommendation:self.recommendation variant:self.variant checkout:self.checkout];
//            [cell useLastItemSeparator:NO];
//            break;
//        case LUVCheckoutCellTypeShipTax:
//            [(LUVCheckoutOrderFieldCell *)cell updateFeesWithCheckout:self.checkout];
//            [cell useLastItemSeparator:NO];
//            break;
//        case LUVCheckoutCellTypeTotal:
//            [(LUVCheckoutOrderFieldCell *)cell updateTotalWithCheckout:self.checkout];
//            [cell useLastItemSeparator:YES];
//            break;
//        default:
//            break;
//    }
//}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    switch (indexPath.row) {
//        case LUVCheckoutCellTypeShippingAddress:
//            [self addressCellWasTapped];
//            break;
//        case LUVCheckoutCellTypeBillingInfo:
//            [self creditButtonWasPressed:nil];
//            break;
//        case LUVCheckoutCellTypeVariant:
//            [self receiptCellWasTapped];
//            break;
//    }
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    CGFloat height;
//    switch (indexPath.row) {
//        case LUVCheckoutCellTypeInfoTitle:
//        case LUVCheckoutCellTypeOrderTitle:
//            height = [LUVListItemCell cellHeight];
//            break;
//        default:
//            height = kLUVTableCellHeight;
//            break;
//    }
//    return height;
//}

@end

//
//  PMListingCell.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/3/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMCell.h"

@interface PMListingCell : PMCell

@property (nonatomic, strong) UILabel *productTitleLabel;
@property (nonatomic, strong) UILabel *productDetailLabel;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *productImageView;

+ (CGFloat)cellHeight;
- (void)updatePrice:(NSDecimalNumber *)price;
@end

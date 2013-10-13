//
//  PMListingCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/3/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMListingCell.h"
#import "UIFont+PMAppearance.h"
#import "UIColor+PMAppearance.h"

static const CGFloat kPMListingCellHeight = 90.0f;

@interface PMListingCell ()
@property (nonatomic, strong) NSNumberFormatter *priceFormatter;
@end

@implementation PMListingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        UILabel *productLabel = [[UILabel alloc] init];
        productLabel.font = [UIFont pm_futuraExtendedFontWithSize:15.0f];
        productLabel.textColor = [UIColor pm_grayDarkColor];
        productLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:productLabel];
        self.productTitleLabel = productLabel;
        
        UILabel *detailLabel = [[UILabel alloc] init];
        detailLabel.font = [UIFont pm_futuraLightFontWithSize:13.0f];
        detailLabel.textColor = [UIColor pm_grayDarkColor];
        detailLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:detailLabel];
        self.productDetailLabel = detailLabel;
        
        UILabel *dateLabel = [[UILabel alloc] init];
        dateLabel.font = [UIFont pm_futuraLightFontWithSize:13.0f];
        dateLabel.textColor = [UIColor pm_grayMediumColor];
        dateLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:dateLabel];
        self.dateLabel = dateLabel;
        
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.font = [UIFont pm_futuraExtendedFontWithSize:15.0f];
        priceLabel.textColor = [UIColor pm_orangeColor];
        priceLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:priceLabel];
        self.priceLabel = priceLabel;
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:imageView];
        self.productImageView = imageView;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(productLabel, detailLabel, dateLabel);
        NSDictionary *metrics = @{ @"topSpacing" : @14, @"sectionSpacing" : @1 ,@"variantSpacing" : @7, @"bottomSpacing": @7 };
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topSpacing-[productLabel]-sectionSpacing-[detailLabel(==productLabel)]-variantSpacing-[dateLabel(==productLabel)]-bottomSpacing-|" options:0 metrics:metrics views:views]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeHeight multiplier:1.0f constant:-40.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:20.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:imageView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:15.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:productLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:imageView attribute:NSLayoutAttributeRight multiplier:1.0f constant:5.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:productLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:productLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:priceLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:priceLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0f constant:14.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:productLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:priceLabel attribute:NSLayoutAttributeLeft multiplier:1.0f constant:-5.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:detailLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:productLabel attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:dateLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:productLabel attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f]];
        
    }
    return self;
}

- (void)updatePrice:(NSDecimalNumber *)price
{
    self.priceLabel.text = [self.priceFormatter stringFromNumber:price];
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.productImageView.image = nil;
    self.productDetailLabel.text = nil;
    self.productTitleLabel.text = nil;
    self.dateLabel.text = nil;
    self.priceLabel.text = nil;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeight
{
    return kPMListingCellHeight;
}

#pragma mark - Formatters

- (NSNumberFormatter *)priceFormatter
{
    if (!_priceFormatter) {
        _priceFormatter = [NSNumberFormatter new];
        _priceFormatter.locale = [NSLocale autoupdatingCurrentLocale];
        _priceFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
    }
    return _priceFormatter;
}

@end

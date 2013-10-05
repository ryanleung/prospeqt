//
//  PMCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMCell.h"
#import "UIColor+PMAppearance.h"

static const CGFloat kPMCellHeight = 58.0f;

@interface PMCell ()
@property (nonatomic, strong) NSLayoutConstraint *separatorConstraint;
@end

@implementation PMCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *separatorView = [UIView new];
        separatorView.translatesAutoresizingMaskIntoConstraints = NO;
        separatorView.layer.zPosition = CGFLOAT_MAX;
        [self.contentView addSubview:separatorView];
        separatorView.backgroundColor = [UIColor pm_grayMediumColor];
        NSDictionary *views = NSDictionaryOfVariableBindings(separatorView);
        NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:separatorView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0f constant:0];
        [self addConstraint:constraint];
        self.separatorConstraint = [NSLayoutConstraint constraintWithItem:separatorView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0f constant:15.0f];
        [self addConstraint:self.separatorConstraint];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[separatorView(==0.5)]|" options:0 metrics:nil views:views]];
        self.separatorView = separatorView;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeight
{
    return kPMCellHeight;
}

- (void)useLastItemSeparator:(BOOL)option
{
    if (option) {
        self.separatorConstraint.constant = 0;
    } else {
        self.separatorConstraint.constant = 15.0f;
    }
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.separatorVisible = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //Fix for ios 6 to bring the separatorView forward
    //and remove the white background on the textLabel
    [self bringSubviewToFront:self.separatorView];
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.opaque = NO;
}

#pragma mark - Properties

- (void)setSeparatorVisible:(BOOL)separatorVisible
{
    _separatorVisible = separatorVisible;
    self.separatorView.hidden = !separatorVisible;
}
@end

//
//  PMAddressCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMAddressCell.h"

@implementation PMAddressCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        self.textLabel.font = [UIFont pm_futuraLightFontWithSize:22.0f];
        self.textLabel.textColor = [UIColor pm_grayDarkColor];
        self.textLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.backgroundColor = [UIColor pm_grayDarkColor];
        self.textLabel.textColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.textLabel.textColor = [UIColor pm_grayDarkColor];
    }
    self.imageView.highlighted = highlighted;
}

@end

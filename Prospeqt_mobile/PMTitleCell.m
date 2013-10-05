//
//  PMTitleCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMTitleCell.h"
#import "UIColor+PMAppearance.h"
#import "UIFont+PMAppearance.h"

@implementation PMTitleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor pm_backgroundColor];
        
        self.textLabel.font = [UIFont pm_futuraLightFontWithSize:27.0f];
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

@end

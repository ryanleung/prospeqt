//
//  PMLocationAccessoryLabelView.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/27/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMLocationAccessoryLabelView.h"

@implementation PMLocationAccessoryLabelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.accessoryImage.image = [UIImage imageNamed:@"LocationPin"];
    }
    return self;
}

- (void)setLocationWithCity:(NSString *)city State:(NSString *)state
{
    NSString *locationFormat = NSLocalizedString(@"global.locationFormat", @"locationFormat");
    self.textLabel.text = [NSString stringWithFormat:locationFormat, city, state];
}
@end

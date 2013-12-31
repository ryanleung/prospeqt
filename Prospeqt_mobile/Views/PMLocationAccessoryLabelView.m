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
@end

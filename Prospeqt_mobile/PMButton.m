//
//  PMButton.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/12/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMButton.h"

@implementation PMButton

- (void)setHighlighted:(BOOL)highlighted
{
    if (highlighted) {
        self.alpha = 0.5;
    } else {
        [UIView animateWithDuration:0.3 animations:^{
            self.alpha = 1.0;
        }];
    }
}

@end

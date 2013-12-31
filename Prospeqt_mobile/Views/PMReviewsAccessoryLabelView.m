//
//  PMReviewsAccessoryLabelView.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/27/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMReviewsAccessoryLabelView.h"

@implementation PMReviewsAccessoryLabelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.accessoryImage.image = [UIImage imageNamed:@"ThumbsUp_Active"];
    }
    return self;
}

- (void)setRatings:(NSNumber *)rating
{
    NSString *ratingsFormat = NSLocalizedString(@"ratings.format", @"ratingsFormat");
    self.textLabel.text = [NSString stringWithFormat:ratingsFormat, rating];
}
@end

//
//  PMTextFieldCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/31/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMTextFieldCell.h"

@implementation PMTextFieldCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITextField *textField = [UITextField new];
        textField.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:textField];
        self.textField = textField;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(textField);
        NSDictionary *metrics = @{ @"spacer" : @3 };
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-spacer-[textField]|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[textField]|" options:0 metrics:metrics views:views]];
    }
    return self;
}
@end

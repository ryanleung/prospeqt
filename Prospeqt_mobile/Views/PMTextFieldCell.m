//
//  PMTextFieldCell.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/31/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMTextFieldCell.h"

@implementation PMTextFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UITextField *textField = [UITextField new];
        textField.translatesAutoresizingMaskIntoConstraints = NO;
        textField.font = [UIFont pm_futuraExtendedFontWithSize:20.0f];
        textField.textColor = [UIColor pm_grayDarkColor];
        textField.delegate = self;
        [self.contentView addSubview:textField];
        self.textField = textField;
        
        NSDictionary *views = NSDictionaryOfVariableBindings(textField);
        NSDictionary *metrics = @{ @"spacer" : @20 };
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-spacer-[textField]|" options:0 metrics:metrics views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[textField]|" options:0 metrics:metrics views:views]];
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.textField resignFirstResponder];
    return YES;
}
@end

//
//  PMSingleLineFormField.m
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/18/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMSingleLineFormField.h"

@implementation PMSingleLineFormField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITextField *textField = [UITextField new];
        textField.font = [UIFont pm_futuraLightFontWithSize:15.0f];
        textField.textColor = [UIColor pm_grayDarkColor];
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        textField.returnKeyType = UIReturnKeyNext;
        textField.delegate = self;
        self.inputView = textField;
        _textField = textField;
    }
    return self;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self.delegate formFieldDidBeginEditing:self];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self.delegate formFieldDidEndEditing:self];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self resignFirstResponder];
    [self.delegate formFieldDidMoveNext:self];
    return NO;
}

@end

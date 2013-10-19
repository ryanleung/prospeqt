//
//  PMFormField.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/16/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PMFormFieldDelegate;

@interface PMFormField : UIControl
@property (nonatomic, weak) UIView *rightBorderView;
@property (nonatomic, weak) UIView *topBorderView;
@property (nonatomic, weak) UIView *bottomBorderView;
@property (nonatomic, assign) CGFloat bottomBarViewInset;
@property (nonatomic, weak) UIView *inputView;
@property (nonatomic, assign) BOOL required;
@property (nonatomic, assign, readonly) BOOL hasValue;
@property (nonatomic, weak) id<PMFormFieldDelegate> delegate;
@end

@protocol PMFormFieldDelegate <NSObject>
- (void)formFieldDidBeginEditing:(PMFormField *)formField;
- (void)formFieldDidEndEditing:(PMFormField *)formField;
- (void)formFieldDidChangeValue:(PMFormField *)formField;
- (void)formFieldDidMoveNext:(PMFormField *)formField;

@end
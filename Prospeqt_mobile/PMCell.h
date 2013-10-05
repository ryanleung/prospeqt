//
//  PMCell.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/4/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMCell : UITableViewCell

+ (CGFloat)cellHeight;

@property (nonatomic, strong) UIView *separatorView;
@property (nonatomic, assign) BOOL separatorVisible;

/** If last object in UITableView, use a long separator line instead of the indented one
 @param option YES to signify last item, use long separator, NO to use indented separator
 @discussion separator should not indent on last item of uitableview
 */
- (void)useLastItemSeparator:(BOOL)option;
@end

//
//  PMSitePostCell.h
//  Prospeqt_mobile
//
//  Created by Ryan Leung on 10/19/13.
//  Copyright (c) 2013 Prospeqt. All rights reserved.
//

#import "PMCell.h"

@class PMButton;
@class PMSitePostCell;

@protocol PMSitePostCellDelegate <NSObject>
- (void)postSiteCellDidTapFollowButton:(PMSitePostCell *)cell;
@end
@interface PMSitePostCell : PMCell
@property (nonatomic, strong) PMButton *postButton;
@property (nonatomic, weak) id<PMSitePostCellDelegate> delegate;
@end

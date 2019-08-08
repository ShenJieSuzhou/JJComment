//
//  JJCommentCell.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJcommentFrame.h"
@class JJCommentCell;

@protocol JJCommentCellDelegate <NSObject>

@optional

- (void)commentCell:(JJCommentCell *)commentCell didClickUser:(id)user;

@end

@interface JJCommentCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) JJCommentFrame *commentFrame;

@property (nonatomic, weak) id<JJCommentCellDelegate> delegate;

@end



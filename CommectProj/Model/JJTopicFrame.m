//
//  JJTopicFrame.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJTopicFrame.h"
#import <UIKit/UIKit.h>
#import "JJCommentConstant.h"
#import "NSString+JJSize.h"
#import <YYText/YYText.h>
#import "JJComment.h"
#import "JJCommentFrame.h"


@implementation JJTopicFrame

- (id)init{
    self = [super init];
    if(self){
        _commentFrames = [NSMutableArray new];
    }
    
    return self;
}

- (void)setTopic:(JJTopic *)topic{
    _topic = topic;
    
    // 整个宽度
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 头像
    CGFloat avatarX = JJTopicHorizontalSpace;
    CGFloat avatarY = JJTopicVerticalSpace;
    CGFloat avatarW = JJTopicAvatarWH;
    CGFloat avatarH = JJTopicAvatarWH;
    self.avatarFrame = CGRectMake(avatarX, avatarY, avatarW, avatarH);
    
    // 更多
    CGFloat moreW = JJTopicMoreButtonW;
    CGFloat moreX = width - moreW;
    CGFloat moreY = avatarY;
    CGFloat moreH = avatarH * .5f;
    self.moreFrame = CGRectMake(moreX, moreY, moreW, moreH);
    
    // 点赞
    CGFloat likeW = topic.likeNumsString ? ([topic.likeNumsString jj_sizeWithFont:[UIFont systemFontOfSize:10.0f]].width + 30):44;
    CGFloat likeX = CGRectGetMinX(self.moreFrame) - likeW;
    CGFloat likeY = avatarY;
    CGFloat likeH = moreH;
    self.likeFrame = CGRectMake(likeX, likeY, likeW, likeH);
    
    // 昵称
    CGFloat nicknameX = CGRectGetMaxX(self.avatarFrame) + JJTopicHorizontalSpace;
    CGFloat nicknameY = avatarY;
    CGFloat nicknameW = CGRectGetMinX(self.likeFrame) - nicknameX;
    CGFloat nicknameH = moreH;
    self.nicknameFrame = CGRectMake(nicknameX, nicknameY, nicknameW, nicknameH);
    
    // 时间
    CGFloat createX = nicknameX;
    CGFloat createY = CGRectGetMaxY(self.nicknameFrame);
    CGFloat createW = width - createX;
    CGFloat createH = moreH;
    self.createTimeFrame = CGRectMake(createX, createY, createW, createH);
    
    // 内容
    CGFloat textX = nicknameX;
    CGSize textLimitSize = CGSizeMake(width - textX - JJTopicHorizontalSpace, MAXFLOAT);
    CGFloat textY = CGRectGetMaxY(self.nicknameFrame)+CGRectGetHeight(self.nicknameFrame);
    CGFloat textH = [YYTextLayout layoutWithContainerSize:textLimitSize text:topic.attributedText].textBoundingSize.height + JJTopicVerticalSpace + JJTopicVerticalSpace;
    
    self.textFrame = CGRectMake(textX, textY, textLimitSize.width, textH);
    
    // 评论
    CGFloat tableViewX = textX;
    CGFloat tableViewY = CGRectGetMaxY(self.textFrame);
    CGFloat tableViewW = textLimitSize.width;
    CGFloat tableViewH = 0;
    
    if([topic.replayComments count] > 0){
        for(JJComment *comment in topic.replayComments ){
            JJCommentFrame *commentFrame = [[JJCommentFrame alloc] init];
            commentFrame.maxW = textLimitSize.width;
            commentFrame.comment = comment;
            [self.commentFrames addObject:commentFrame];
            
            tableViewH += commentFrame.cellHeight;
        }
    }
    
    self.tableViewFrame = CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH);
    
    self.height = CGRectGetMaxX(self.textFrame);
}


@end

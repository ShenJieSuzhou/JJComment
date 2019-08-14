//
//  JJTopic.h
//  CommectProj
//
//  Created by shenjie on 2019/8/7.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJTopic : NSObject

// 帖子ID
@property (nonatomic, copy) NSString *postId;

// 评论ID
@property (nonatomic, copy) NSString *topicID;

// 点赞数
@property (nonatomic, assign) NSInteger likeNums;

/** 点赞 str **/
@property (nonatomic , copy) NSString * likeNumsString;

/** 是否点赞  0 没有点赞 1 是点赞*/
@property (nonatomic , assign) BOOL like;

// 创建时间
@property (nonatomic, copy) NSString *createTime;

// 内容
@property (nonatomic, copy) NSString *text;

// 回复
@property (nonatomic, strong) NSMutableArray *replayComments;

// 用户
@property (nonatomic, strong) JJUser *user;

// 评论总数
@property (nonatomic, assign) NSInteger commentsCount;

// 富文本
- (NSAttributedString *)attributedText;

@end

NS_ASSUME_NONNULL_END

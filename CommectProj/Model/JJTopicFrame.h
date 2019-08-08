//
//  JJTopicFrame.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#import "JJTopic.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJTopicFrame : NSObject

/** 头像frame */
@property (nonatomic, assign, readonly) CGRect avatarFrame;

/** 昵称frame */
@property (nonatomic, assign, readonly) CGRect nicknameFrame;

/** 点赞frame */
@property (nonatomic, assign, readonly) CGRect thumbFrame;

/** 更多frame */
@property (nonatomic, assign, readonly) CGRect moreFrame;

/** 时间frame */
@property (nonatomic, assign, readonly) CGRect createTimeFrame;

/** 话题内容frame */
@property (nonatomic, assign, readonly) CGRect textFrame;

/** height 这里只是 整个话题占据的高度 */
@property (nonatomic, assign, readonly) CGFloat height;

/** 评论尺寸模型 由于后期需要用到，所以不涉及为只读 */
@property (nonatomic, strong ) NSMutableArray *commentFrames;

/** tableViewFrame cell嵌套tableView用到 本人有点懒 ，公用了一套模型 */
@property (nonatomic, assign, readonly) CGRect tableViewFrame;


@property (nonatomic, strong) JJTopic *topic;

@end

NS_ASSUME_NONNULL_END

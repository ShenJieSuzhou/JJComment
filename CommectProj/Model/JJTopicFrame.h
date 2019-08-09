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
@property (nonatomic, assign) CGRect avatarFrame;

/** 昵称frame */
@property (nonatomic, assign) CGRect nicknameFrame;

/** 点赞frame */
@property (nonatomic, assign) CGRect likeFrame;

/** 点赞 str **/
@property (nonatomic , copy , readonly) NSString * likeNumsString;

/** 更多frame */
@property (nonatomic, assign) CGRect moreFrame;

/** 时间frame */
@property (nonatomic, assign) CGRect createTimeFrame;

/** 话题内容frame */
@property (nonatomic, assign) CGRect textFrame;

/** height 这里只是 整个话题占据的高度 */
@property (nonatomic, assign) CGFloat height;

/** 评论尺寸模型 由于后期需要用到，所以不涉及为只读 */
@property (nonatomic, strong ) NSMutableArray *commentFrames;

/** tableViewFrame **/
@property (nonatomic, assign) CGRect tableViewFrame;


@property (nonatomic, strong) JJTopic *topic;

@end

NS_ASSUME_NONNULL_END

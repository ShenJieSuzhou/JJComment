//
//  JJCommentConstant.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentConstant.h"

/** 最大字数 */
NSInteger const JJCommentMaxWords  = 300;

/** 弹出评论框View最小距离 */
CGFloat const JJTopicCommentToolBarMinHeight = 105;

/** 弹出评论框View的除了编辑框的高度 */
CGFloat const JJTopicCommentToolBarWithNoTextViewHeight = 75;

/** 文本行高 */
CGFloat const JJCommentContentLineSpacing = 10.0f;


/** 视频评论成功的通知 */
NSString * const JJCommentSuccessNotification = @"JJCommentSuccessNotification";

/** 视频点赞成功的通知 */
NSString * const JJLikeSuccessNotification = @"JJLikeSuccessNotification" ;

/** 视频评论回复成功的通知 */
NSString * const JJCommentReplySuccessNotification = @"JJCommentReplySuccessNotification" ;

/** 视频评论获取成功的事件 */
NSString * const JJCommentRequestDataSuccessNotification = @"JJCommentRequestDataSuccessNotification" ;

/** 视频评论获取成功的事件 */
NSString * const JJCommentRequestDataSuccessKey = @"JJCommentRequestDataSuccessKey" ;


/**  话题水平方向间隙 */
CGFloat const JJTopicHorizontalSpace = 10.0f;
/**  话题垂直方向间隙 */
CGFloat const JJTopicVerticalSpace = 10.0f;
/**  话题更多按钮宽 */
CGFloat const JJTopicMoreButtonW = 24.0f;

/**  评论水平方向间隙 */
CGFloat const JJCommentHorizontalSpace = 11.0f;
/**  评论垂直方向间隙 */
CGFloat const JJCommentVerticalSpace = 7.0f;

CGFloat const JJRecommendCommentHeaderViewHeight = 100.0f;

/**  话题头像宽高 */
CGFloat const JJTopicAvatarWH = 30.0f;

/** 评论高度 */
CGFloat const JJCommentHeaderViewHeight = 100.0f;

/** 评论工具高度 */
CGFloat const JJCommentToolBarHeight  = 44.0f  ;

/** 每页数据 */
NSUInteger const JJCommentMaxCount = 30;

/**
 *  全局细线高度 .75f
 */
CGFloat const JJGlobalBottomLineHeight = .55f;

@implementation JJCommentConstant




@end

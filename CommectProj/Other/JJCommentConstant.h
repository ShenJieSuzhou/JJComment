//
//  JJCommentConstant.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIFont+JJExtension.h"

UIKIT_EXTERN CGFloat const JJCommentHorizontalSpace;

UIKIT_EXTERN CGFloat const JJCommentVerticalSpace;

UIKIT_EXTERN CGFloat const JJRecommendCommentHeaderViewHeight;

UIKIT_EXTERN CGFloat const JJTopicAvatarWH;

/** 弹出评论框View最小距离 */
UIKIT_EXTERN CGFloat const JJTopicCommentToolBarMinHeight;

/** 弹出评论框View的除了编辑框的高度 */
UIKIT_EXTERN CGFloat const JJTopicCommentToolBarWithNoTextViewHeight;

UIKIT_EXTERN NSInteger const JJCommentMaxWords;

UIKIT_EXTERN CGFloat const JJCommentContentLineSpacing;

/** 视频评论成功的通知 */
UIKIT_EXTERN NSString * const JJCommentSuccessNotification;

/** 视频点赞成功的通知 */
UIKIT_EXTERN NSString * const JJLikeSuccessNotification;

/** 视频评论回复成功的通知 */
UIKIT_EXTERN NSString * const JJCommentReplySuccessNotification;

/** 视频评论获取成功的事件 */
UIKIT_EXTERN NSString * const JJCommentRequestDataSuccessNotification;

/** 视频评论获取成功的事件 */
UIKIT_EXTERN NSString * const JJCommentRequestDataSuccessKey;

/**  话题头像宽高 */
UIKIT_EXTERN CGFloat const JJTopicAvatarWH;
/**  话题水平方向间隙 */
UIKIT_EXTERN CGFloat const JJTopicHorizontalSpace;
/**  话题垂直方向间隙 */
UIKIT_EXTERN CGFloat const JJTopicVerticalSpace;
/**  话题更多按钮宽 */
UIKIT_EXTERN CGFloat const JJTopicMoreButtonW;

/** 评论高度 */
UIKIT_EXTERN CGFloat const JJCommentHeaderViewHeight;

/** 评论工具高度 */
UIKIT_EXTERN CGFloat const JJCommentToolBarHeight;

/** 每页数据 */
UIKIT_EXTERN NSUInteger const JJCommentMaxCount;

/**
 *  全局细线高度 .75f
 */
UIKIT_EXTERN CGFloat const JJGlobalBottomLineHeight;

// 屏幕总尺寸
#define JJMainScreenBounds  [UIScreen mainScreen].bounds
#define JJMainScreenHeight  [UIScreen mainScreen].bounds.size.height
#define JJMainScreenWidth   [UIScreen mainScreen].bounds.size.width

/** 弹出评论框View距离顶部的最小高度 */
#define JJTopicCommentToolBarMinTopInset (JJMainScreenWidth * 9.0f/16.0f + 20)

/**
 *  Frame PX  ---> Pt 6的宽度 全部向下取整数
 */
#define JJPxConvertPt(__Px) floor((__Px) *JJMainScreenWidth/375.0f)
/**
 *  Frame PX  ---> Pt 6的宽度 返回一个合适的值 按钮手指触摸点 44
 */
#define JJFxConvertFitPt(__px) (MAX(JJPxConvertPt(__Px),44))

/**  评论内容字体大小 */
#define JJCommentTextFont JJMediumFont(12.0f)

/** 加粗字体 **/
#define JJBlodFont(__px) [UIFont fontWithName:@"Helvetica-Bold" size:__px];

/** 常规字体 **/
#define JJReguFont(__px) [UIFont fontWithName:@"Helvetica" size:__px];

//获取导航栏+状态栏的高度
#define getNavAndStatusHight  self.navigationController.navigationBar.frame.size.height+[[UIApplication sharedApplication] statusBarFrame].size.height

@interface JJCommentConstant : NSObject

@end



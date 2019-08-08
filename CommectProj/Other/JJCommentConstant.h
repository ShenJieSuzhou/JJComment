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

@interface JJCommentConstant : NSObject

@end



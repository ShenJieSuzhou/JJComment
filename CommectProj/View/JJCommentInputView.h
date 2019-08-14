//
//  JJCommentInputView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJCommentReplay.h"
#import <YYText/YYText.h>
#import <YYText/YYTextView.h>
#import <Masonry/Masonry.h>
#import "JJCommentConstant.h"
#import "JJTopicManager.h"

@class JJCommentInputView;

@protocol JJCommentInputViewDelegate <NSObject>
@optional
- (void)commentInputView:(JJCommentInputView *)inputPanelView attributedText:(NSString *)attributedText;
@end


@interface JJCommentInputView : UIView<YYTextViewDelegate>

/** 底部工具条 */
@property (nonatomic , weak) UIView *bottomToolBar;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) YYTextView *textView;

// 当前字数
@property (nonatomic , strong) YYLabel *words;

/** 记录之前编辑框的高度 */
@property (nonatomic , assign) CGFloat previousTextViewContentHeight;

/** 记录键盘的高度 */
@property (nonatomic , assign) CGFloat keyboardHeight;

/** cacheText */
@property (nonatomic , copy) NSString *cacheText;

/** 回复评论 */
@property (nonatomic , strong) JJCommentReplay *commentReply;

@property (nonatomic, weak) id<JJCommentInputViewDelegate> delegate;

- (void)show;

- (void)dismissByUser:(BOOL)state;

/** 设置缓存的评论 */
- (void)setCacheTopicText;

@end



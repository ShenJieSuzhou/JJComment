//
//  JJCommentInputView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJCommentReplay.h"

@class JJCommentInputView;

@protocol JJCommentInputViewDelegate <NSObject>
@optional
- (void)commentInputView:(JJCommentInputView *)inputPanelView attributedText:(NSString *)attributedText;
@end


@interface JJCommentInputView : UIView

/** 回复评论 */
@property (nonatomic , strong) JJCommentReplay *commentReply;

@property (nonatomic, weak) id<JJCommentInputViewDelegate> delegate;

- (void)show;

- (void)dismissByUser:(BOOL)state;

@end



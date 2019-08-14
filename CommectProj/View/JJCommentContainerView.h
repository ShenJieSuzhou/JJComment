//
//  JJCommentContainerView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYText.h>
#import "CommentCountView.h"
NS_ASSUME_NONNULL_BEGIN

@class JJCommentContainerView;
@protocol JJCommentContainerViewDelegate <NSObject>
@optional
-(void)commentContaninerBtnClickAction:(JJCommentContainerView *)commentContainerView;

@end

@interface JJCommentContainerView : UIView

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, strong) UIButton *commentBtn;

@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) CommentCountView *commentCountView;

@property (nonatomic, weak) id<JJCommentContainerViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END

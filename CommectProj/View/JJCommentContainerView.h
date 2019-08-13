//
//  JJCommentContainerView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYText.h>
NS_ASSUME_NONNULL_BEGIN

@interface JJCommentContainerView : UIView

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, strong) UIButton *commentBtn;

@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) UIView *commentCountView;

@property (nonatomic, strong) YYLabel *commentLabel;

@end

NS_ASSUME_NONNULL_END

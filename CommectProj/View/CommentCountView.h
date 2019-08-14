//
//  CommentCountView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYText.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentCountView : UIView

@property (nonatomic, strong) UIImageView *imageV;

@property (nonatomic, strong) YYLabel *commentCounts;

@property (nonatomic, assign) NSInteger commentsNum;

@end

NS_ASSUME_NONNULL_END

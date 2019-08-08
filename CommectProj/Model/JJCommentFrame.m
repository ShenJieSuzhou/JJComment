//
//  JJCommentFrame.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentFrame.h"
#import "JJCommentConstant.h"
#import <YYText/YYText.h>

@implementation JJCommentFrame

- (void)setComment:(JJComment *)comment{
    
    _comment = comment;
    
    CGFloat textX = JJCommentHorizontalSpace;
    CGFloat textY = JJCommentVerticalSpace;
    CGSize textLimitSize = CGSizeMake(self.maxW - 2*textX, MAXFLOAT);
    CGFloat textH = [YYTextLayout layoutWithContainerSize:textLimitSize text:_comment.attributedText].textBoundingSize.height;
    self.textFrame = CGRectMake(textX, textY, textLimitSize.width, textH);
    self.cellHeight = CGRectGetMaxY(self.textFrame) + JJCommentVerticalSpace;
}

@end

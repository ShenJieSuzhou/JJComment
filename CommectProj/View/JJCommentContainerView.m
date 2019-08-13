//
//  JJCommentContainerView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentContainerView.h"


@implementation JJCommentContainerView
@synthesize commentCount = _commentCount;
@synthesize commentBtn = _commentBtn;
@synthesize shareBtn = _shareBtn;
@synthesize commentCountView = _commentCountView;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self commonInitlization];
    }
    return self;
}

- (void)commonInitlization{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    [self.commentBtn setTitle:[NSString stringWithFormat:@"已有%zd条评论，快来说说你的感想吧", _commentCount] forState:UIControlStateNormal];
    
}

- (void)layoutSubviews{
    
}


- (UIButton *)commentBtn{
    if(!_commentBtn){
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentBtn addTarget:self action:@selector(commentBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _commentBtn;
}

- (UIView *)commentCountView{
    if(!_commentCountView){
        _commentCountView = [[UIView alloc] init];
    }
    return _commentCountView;
}

- (UIButton *)shareBtn{
    if(!_shareBtn){
        _shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _shareBtn;
}

#pragma mark - 事件处理
- (void)commentBtnDidClicked:(UIButton *)sender{

}

@end

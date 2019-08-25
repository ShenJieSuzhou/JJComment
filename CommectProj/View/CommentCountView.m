//
//  CommentCountView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "CommentCountView.h"
#import <Masonry.h>
#import "JJCommentConstant.h"

@implementation CommentCountView
@synthesize imageV = _imageV;
@synthesize commentCounts = _commentCounts;
@synthesize commentsNum = _commentsNum;

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self commonInitlization];
    }
    return self;
}

- (void)commonInitlization{
    [self addSubview:self.imageV];
    [self addSubview:self.commentCounts];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    
    [self.commentCounts mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(-2.0f);
        make.right.equalTo(self).offset(10.0f);
        make.left.mas_equalTo(self).offset(15.0f);
        make.height.mas_equalTo(15);
    }];
    
    if(_commentsNum == 0){
        [self.commentCounts setHidden:YES];
    }else{
        [self.commentCounts setHidden:NO];
    }
}

- (UIImageView *)imageV{
    if(!_imageV){
        _imageV = [UIImageView new];
        [_imageV setImage:[UIImage imageNamed:@"comments"]];
    }
    return _imageV;
}

- (YYLabel *)commentCounts{
    if(!_commentCounts){
        _commentCounts = [YYLabel new];
        [_commentCounts setBackgroundColor:JJAlphaColor(244, 243, 245, 1)];
        _commentCounts.textColor = [UIColor redColor];
        _commentCounts.font = JJReguFont(10.0f);
    }
    return _commentCounts;
}

- (void)setCommentsNum:(NSInteger)commentsNum{
    if(commentsNum == 0){
        return;
    }
    _commentsNum = commentsNum;
    self.commentCounts.text = [NSString stringWithFormat:@"%zd", commentsNum];
}

@end

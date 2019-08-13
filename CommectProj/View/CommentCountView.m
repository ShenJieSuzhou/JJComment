//
//  CommentCountView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "CommentCountView.h"
#import <Masonry.h>

@implementation CommentCountView
@synthesize imageV = _imageV;
@synthesize commentCounts = _commentCounts;

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
        make.left.bottom.equalTo(self);
        make.top.mas_offset(self).offset(15);
        make.right.mas_offset(self).offset(15);
    }];
    
    [self.commentCounts mas_makeConstraints:^(MASConstraintMaker *make) {
        
    }];
}

- (UIImageView *)imageV{
    if(!_imageV){
        _imageV = [UIImageView new];
    }
    return _imageV;
}

- (YYLabel *)commentCounts{
    if(!_commentCounts){
        _commentCounts = [YYLabel new];
    }
    return _commentCounts;
}

@end

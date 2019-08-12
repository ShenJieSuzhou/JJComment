//
//  JJCommentDecorateHeader.m
//  CommectProj
//
//  Created by shenjie on 2019/8/12.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentDecorateHeader.h"
#import <Masonry/Masonry.h>
#import "JJCommentConstant.h"

@implementation JJCommentDecorateHeader
@synthesize titleLabel = _titleLabel;
@synthesize cubeView = _cubeView;

-(instancetype)init{
    self = [super init];
    if(self){
        [self commonInitlization];
    }
    return self;
}

- (void)commonInitlization{
    [self setBackgroundColor:[UIColor whiteColor]];
    
    self.titleLabel = [[YYLabel alloc] init];
    self.titleLabel.text = @"观点";
    self.titleLabel.font = JJBlodFont(18);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    
    self.cubeView = [[UIImageView alloc] init];
    [self.cubeView setBackgroundColor:[UIColor redColor]];
    [self addSubview:self.cubeView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.cubeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.height.mas_equalTo(self);
        make.width.mas_equalTo(8);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(25);
        make.width.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
}


@end

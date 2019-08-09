//
//  JJTopicFooterView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/9.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJTopicFooterView.h"
#import <Masonry/Masonry.h>
#import "JJCommentConstant.h"

@implementation JJTopicFooterView

+ (instancetype)footerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"TopicFooter";
    JJTopicFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (footer == nil) {
        // 缓存池中没有, 自己创建
        footer = [[self alloc] initWithReuseIdentifier:ID];
    }
    return footer;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 初始化
        [self setup];
        
        // 创建自控制器
        [self setupSubViews];
        
        // 布局子控件
        [self makeSubViewsConstraints];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    return self;
}

- (void)setSection:(NSInteger)section allSections:(NSInteger)sections{
    self.section = section;
    
    if (sections == 1) {
        self.divider.hidden = YES;
    } else if (section == 0) { // 首行
        self.divider.hidden = NO;
    } else if (section == sections - 1) { // 末行
        self.divider.hidden = YES;
    } else { // 中间
        self.divider.hidden = NO;
    }}


- (void)setup{
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setupSubViews{
    // 分割线
    self.divider = [[UIImageView alloc] init];
    [self.divider setBackgroundColor:[UIColor lightGrayColor]];
    [self.contentView addSubview:self.divider];
}

#pragma mark - 布局子控件
- (void)makeSubViewsConstraints
{
    [self.divider mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.bottom.and.right.equalTo(self.contentView);
        make.height.mas_equalTo(JJGlobalBottomLineHeight);
    }];
}

@end

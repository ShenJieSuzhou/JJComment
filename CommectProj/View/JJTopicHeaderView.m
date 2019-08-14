//
//  JJTopicHeaderView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/9.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJTopicHeaderView.h"
#import "JJCommentConstant.h"

@implementation JJTopicHeaderView

+ (instancetype)topicHeaderView
{
    return [[self alloc] init];
}

+ (instancetype)headerViewWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JJTopicHeader";
    JJTopicHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        // 缓存池中没有, 自己创建
        header = [[self alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 初始化
        [self setup];
        
        // 创建自控制器
        [self setupSubViews];
    }
    return self;
}

- (void)setTopicFrame:(JJTopicFrame *)topicFrame{
    _topicFrame = topicFrame;
    
    JJTopic *topic = topicFrame.topic;
    JJUser *user = topic.user;
    
    // 头像
    self.avatarView.frame = topicFrame.avatarFrame;
    [self.avatarView setImage:[UIImage imageNamed:@"defaultAvatar"]];
    
    // 昵称
    self.nicknameLable.frame = topicFrame.nicknameFrame;
    self.nicknameLable.text = user.nickname;
    
    // 点赞
    self.likeBtn.frame = topicFrame.likeFrame;
    [self.likeBtn setTitle:topic.likeNumsString forState:UIControlStateNormal];
    self.likeBtn.selected = topic.like;
    
    // 时间
    self.createTimeLabel.frame = topicFrame.createTimeFrame;
    self.createTimeLabel.text = topic.createTime;
    
    // 内容
    self.contentLabel.frame = topicFrame.textFrame;
    self.contentLabel.attributedText = topic.attributedText;
}

- (void)setup{
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setupSubViews{
    // 头像
    UIImageView *avatarView = [UIImageView new];
    
    avatarView.layer.cornerRadius = JJTopicAvatarWH*.5f;
    // 这样写比较消耗性能
    avatarView.layer.masksToBounds = YES;
    
    self.avatarView = avatarView;
    [self.contentView addSubview:avatarView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarOrNicknameDidClicked)];
    [avatarView addGestureRecognizer:tap];
    
    // 昵称
    YYLabel *nicknameLable = [[YYLabel alloc] init];
    nicknameLable.text = @"";
    nicknameLable.font = [UIFont systemFontOfSize:10.0f];
    nicknameLable.textAlignment = NSTextAlignmentLeft;
    nicknameLable.textColor = [UIColor blackColor];
    [self.contentView addSubview:nicknameLable];
    self.nicknameLable = nicknameLable;
    
    __weak typeof(self) weakSelf = self;
    nicknameLable.textTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        [weakSelf avatarOrNicknameDidClicked];
    };

    // 点赞按钮
    UIButton *thumbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    thumbBtn.adjustsImageWhenHighlighted = NO;
    [thumbBtn setImage:[UIImage imageNamed:@"like_nor"] forState:UIControlStateNormal];
    [thumbBtn setImage:[UIImage imageNamed:@"like_high"] forState:UIControlStateSelected];
    [thumbBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [thumbBtn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    [thumbBtn addTarget:self action:@selector(likeBtnDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    thumbBtn.titleLabel.font = [UIFont systemFontOfSize:10.0f];
    [self.contentView addSubview:thumbBtn];
    self.likeBtn = thumbBtn;
    
    // 时间
    YYLabel *createTimeLabel = [[YYLabel alloc] init];
    createTimeLabel.text = @"";
    createTimeLabel.font = [UIFont systemFontOfSize:10.0f];;
    createTimeLabel.textAlignment = NSTextAlignmentLeft;
    createTimeLabel.textColor = [UIColor blackColor];
    [self.contentView addSubview:createTimeLabel];
    self.createTimeLabel = createTimeLabel;
    createTimeLabel.textTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        [weakSelf contentTextDidClicked];
    };
    
    // 文本
    YYLabel *contentLabel = [[YYLabel alloc] init];
    // 设置文本的额外区域，修复用户点击文本没有效果
    UIEdgeInsets textContainerInset = contentLabel.textContainerInset;
    textContainerInset.top = JJTopicVerticalSpace;
    textContainerInset.bottom = JJTopicVerticalSpace;
    contentLabel.textContainerInset = textContainerInset;
    
    contentLabel.numberOfLines = 0 ;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    contentLabel.textTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        [weakSelf contentTextDidClicked];
    };
}

// 事件处理
- (void)likeBtnDidClicked:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topicHeaderViewForClickedLikeAction:)]) {
        [self.delegate topicHeaderViewForClickedLikeAction:self];
    }
}

- (void)moreBtnDidClicked:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topicHeaderViewForClickedMoreAction:)]) {
        [self.delegate topicHeaderViewForClickedMoreAction:self];
    }
}

- (void)avatarOrNicknameDidClicked{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topicHeaderViewDidClickedUser:)]) {
        [self.delegate topicHeaderViewDidClickedUser:self];
    }
}

- (void)contentTextDidClicked{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topicHeaderViewDidClickedTopicContent:)]) {
        [self.delegate topicHeaderViewDidClickedTopicContent:self];
    }
}

@end

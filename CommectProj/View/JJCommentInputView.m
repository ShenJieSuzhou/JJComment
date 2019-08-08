//
//  JJCommentInputView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentInputView.h"
#import <YYText/YYText.h>
#import <YYText/YYTextView.h>
#import <Masonry/Masonry.h>
#import "JJCommentConstant.h"
#import "JJTopicManager.h"

@interface JJCommentInputView()<YYTextViewDelegate>

/** 底部工具条 */
@property (nonatomic , weak) UIView *bottomToolBar;

@property (nonatomic, strong) UIView *bottomView;

/** 头像 */
@property (nonatomic , weak) UIImageView *avatarView;

@property (nonatomic, strong) YYLabel *commentLabel;

@property (nonatomic, strong) UIView *topView;

@property (nonatomic, strong) YYTextView *textView;

// 当前字数
@property (nonatomic , strong) YYLabel *words;

/** 记录之前编辑框的高度 */
@property (nonatomic , assign) CGFloat previousTextViewContentHeight;

/** 记录键盘的高度 */
@property (nonatomic , assign) CGFloat keyboardHeight;

/** cacheText */
@property (nonatomic , copy) NSString *cacheText;

@end

@implementation JJCommentInputView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self commonInitlizatiion];
    }
    return self;
}

- (void)commonInitlizatiion{
    // 添加通知中心
    [self addNotificationCenter];
    
    self.backgroundColor = [UIColor clearColor];
    
    // 底部工具条
    UIView *bottomToolBar = [[UIView alloc] init];
    bottomToolBar.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomToolBar];
    self.bottomToolBar = bottomToolBar;
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    self.bottomView = bottomView;
    [self.bottomToolBar addSubview:bottomView];
    
    // 顶部
    UIView *topView = [[UIView alloc] init];
    topView.backgroundColor = [UIColor whiteColor];
    [self.bottomToolBar addSubview:topView];
    self.topView = topView;
    
    CGFloat avatarWH = 20.f;
    // 头像
    UIImageView *avatarView = [UIImageView new];
    avatarView.image = [UIImage imageNamed:@"mh_defaultAvatar"];
    avatarView.layer.cornerRadius = avatarWH *.5f;
    avatarView.layer.masksToBounds = YES;
    self.avatarView = avatarView;
    [topView addSubview:avatarView];
    
    // 评论
    YYLabel *commentLabel = [[YYLabel alloc] init];
    commentLabel.textColor = [UIColor grayColor];
    commentLabel.textAlignment = NSTextAlignmentLeft;
    commentLabel.font = [UIFont systemFontOfSize:11.0f];
    commentLabel.textColor = [UIColor grayColor];
    self.commentLabel = commentLabel;
    [topView addSubview:commentLabel];
    
    // textView
    YYTextView *textView = [[YYTextView alloc] init];
    textView.font = [UIFont systemFontOfSize:13.0f];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.textColor = [UIColor blackColor];
    UIEdgeInsets insets = textView.textContainerInset;
    insets.left = 10;
    insets.right = 10;
    textView.textContainerInset = insets;
    textView.returnKeyType = UIReturnKeySend;
    textView.enablesReturnKeyAutomatically = YES;
    textView.showsVerticalScrollIndicator = NO;
    textView.showsHorizontalScrollIndicator = NO;
    textView.layer.cornerRadius = [UIScreen mainScreen].bounds.size.width / 375 * 5;
    textView.layer.borderWidth = [UIScreen mainScreen].bounds.size.width / 375 * 1;
    textView.layer.borderColor = [UIColor blueColor].CGColor;
    textView.backgroundColor = [UIColor whiteColor];
    textView.placeholderFont = textView.font;
    textView.placeholderTextColor = [UIColor whiteColor];
    textView.delegate = self;
    self.textView = textView;
    [self.bottomToolBar addSubview:textView];
    
    // words
    YYLabel *words = [[YYLabel alloc] init];
    words.textAlignment = NSTextAlignmentLeft;
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:@"0/300字"];
    attributedText.yy_font = [UIFont systemFontOfSize:9.0f];
    attributedText.yy_color = [UIColor blackColor];
    words.attributedText = attributedText;
    [bottomView addSubview: words];
    self.words = words;
}

- (void)layoutSubviews{
    [super layoutSubviews];

    // 布局bottomToolBar
    [self.bottomToolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self);
        make.bottom.equalTo(self).with.offset(JJTopicCommentToolBarMinHeight);
        make.height.mas_equalTo(JJTopicCommentToolBarMinHeight);
        
    }];
    
    // 布局topView
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.and.right.equalTo(self.bottomView);
        make.height.mas_equalTo(35);
    }];
    
    // 布局头像
    CGFloat avatarWH = JJPxConvertPt(20.0f);
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.mas_equalTo(avatarWH);
        make.left.equalTo(self.topView).with.offset(JJPxConvertPt(10.0f));
        make.centerY.equalTo(self.topView);
        
    }];
    
    // 布局评论
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).with.offset(JJPxConvertPt(5.0f));
        make.right.equalTo(self.topView).with.offset(JJPxConvertPt(-19.0f));
        make.top.and.bottom.equalTo(self.topView);
    }];
    
    // 布局textView
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomToolBar.mas_left).with.offset(JJPxConvertPt(10.0f));
        make.right.equalTo(self.bottomToolBar.mas_right).with.offset(JJPxConvertPt(-10.0f));
        make.top.equalTo(self.topView.mas_bottom);
        make.bottom.equalTo(self.bottomView.mas_top);
    }];
    
    // 布局底部
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.and.right.equalTo(self.bottomToolBar);
        make.height.mas_equalTo(40);
    }];
    
    // 布局字数
    [self.words mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView).with.offset(JJPxConvertPt(19.0f));
        make.top.and.bottom.equalTo(self.bottomView);
        make.right.equalTo(self.bottomToolBar.mas_right).with.offset(200.0f);
    }];
}

- (void)show{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:self];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    [self setNeedsUpdateConstraints];
    [self updateFocusIfNeeded];
    [self layoutIfNeeded];
    
    // 延迟一会儿
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.15f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.textView becomeFirstResponder];
    });
}

- (void)dismissByUser:(BOOL)state{
    if (!state) {
        // 自动消失
        if ([self.cacheText isEqualToString:self.textView.text]) {
            // 未做处理
        }else{
            // 如果不一样则需要保存
            if (self.textView.text.length==0)
            {
                //输入框没做任何处理
                if (self.cacheText.length == 0) {
                    // 存@""值
                    [[JJTopicManager shareInstance].replyDictionary setValue:@"" forKey:self.commentReply.commentReplyId];
                }
            }else{
                [[JJTopicManager shareInstance].replyDictionary setValue:self.textView.text forKey:self.commentReply.commentReplyId];
            }
        }
    }else{
        // 解析数据
        [[JJTopicManager shareInstance].replyDictionary removeObjectForKey:self.commentReply.commentReplyId];
    }
    
    [self.textView resignFirstResponder];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.35f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 从父控件移除
        [self removeFromSuperview];
        
    });
}

- (void)setCommentReply:(JJCommentReplay *)commentReply{
    _commentReply = commentReply;
    // 设置数据
    // 设置头像
    self.commentLabel.text = commentReply.text;
    // 设置placeholder
    self.textView.placeholderText = [NSString stringWithFormat:@"回复%@", @"沈杰"];
    // 设置text
    // 获取缓存text
    self.cacheText = [[JJTopicManager shareInstance].replyDictionary objectForKey:commentReply.commentReplyId];
    // 缓存字体
    self.textView.text = self.cacheText;
}

#pragma mark - 添加通知中心
- (void)addNotificationCenter{
    // 添加键盘监听
    [self unregisterKeyboardNotification];
    [self registerKeyboardNotification];
}

// 添加监听
- (void)registerKeyboardNotification{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

// 取消监听
- (void)unregisterKeyboardNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillChangeFrameNotification object:nil];
}

#pragma mark - 事件处理
/** 监听键盘的弹出和隐藏
 */
- (void)keyboardWillChangeFrame:(NSNotification *)notification
{
    NSDictionary *userInfo = notification.userInfo;
    
    // 最终尺寸
    CGRect endFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 开始尺寸
    CGRect beginFrame = [userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    // 动画时间
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationOptions options = ([userInfo[UIKeyboardAnimationCurveUserInfoKey] integerValue] << 16 ) | UIViewAnimationOptionBeginFromCurrentState;
    
    __weak typeof(self) weakSelf = self;
    
    void(^animations)(void) = ^{
        // 回调
        [weakSelf willShowKeyboardWithFromFrame:beginFrame toFrame:endFrame];
    };
    
    // 执行动画
    [UIView animateWithDuration:duration delay:0.0f options:options animations:animations completion:^(BOOL finished) {
        
    }];
}


#pragma mark - 代理
- (void)textViewDidChange:(YYTextView *)textView
{
    // 改变高度
    [self bottomToolBarWillChangeHeight:[self getTextViewHeight:textView]];
    
    // 设置提醒文字
    [self textViewWordsDidChange:textView];
    
}


- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        
        // 发送回复
        [self send];
        //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
        return NO;
    }
    
    return YES;
}

#pragma mark - 辅助方法
/** 键盘改变  后期于鏊考虑表情键盘 */
- (void)willShowKeyboardWithFromFrame:(CGRect)fromFrame toFrame:(CGRect)toFrame
{
    
    if (fromFrame.origin.y == [[UIScreen mainScreen] bounds].size.height)
    {
        // 键盘弹起
        // bottomToolBar距离底部的高度
        [self _bottomToolBarWillChangeBottomHeight:toFrame.size.height];
        
    }else if (toFrame.origin.y == [[UIScreen mainScreen] bounds].size.height)
    {
        // 键盘落下
        // bottomToolBar距离底部的高度
        [self _bottomToolBarWillChangeBottomHeight:0];
        
    }else
    {
        // bottomToolBar距离底部的高度
        [self _bottomToolBarWillChangeBottomHeight:toFrame.size.height];
    }
}

/** 距离控制器底部的高度 */
- (void)_bottomToolBarWillChangeBottomHeight:(CGFloat)bottomHeight
{
    // 记录键盘的高度
    self.keyboardHeight = bottomHeight;
    
    // fix 掉键盘落下 输入框还没落下的bug 键盘掉下的bug
    if (bottomHeight<=0) {
        bottomHeight = -1 * JJMainScreenHeight;
    }
    // 之前bottomToolBar的尺寸
    [self.bottomToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        
        // 设置高度
        make.bottom.equalTo(self).with.offset(-1 * bottomHeight);
    }];
    
    
    // 键盘高度改变了也要去查看一下bottomToolBar的布局
    [self bottomToolBarWillChangeHeight:[self getTextViewHeight:self.textView]];
    
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    // 适当时候更新布局
    [self layoutIfNeeded];
    
}

/** 获取编辑框的高度 */
- (CGFloat)getTextViewHeight:(YYTextView *)textView{
    return textView.textLayout.textBoundingSize.height;
}

#pragma mark - 编辑框将要到那个高度
- (void)bottomToolBarWillChangeHeight:(CGFloat)toHeight{
    // 需要加上 MHTopicCommentToolBarWithNoTextViewHeight才是bottomToolBarHeight
    toHeight = toHeight + JJTopicCommentToolBarWithNoTextViewHeight;
    
    if (toHeight < JJTopicCommentToolBarMinHeight || self.textView.attributedText.length == 0){
        toHeight = JJTopicCommentToolBarMinHeight;
    }
    
    // 不允许遮盖住 视频播放
    CGFloat maxHeight = JJMainScreenHeight - JJTopicCommentToolBarMinTopInset - self.keyboardHeight;
    
    if (toHeight > maxHeight) { toHeight = maxHeight ;}
    
    // 高度是之前的高度  跳过
    if (toHeight == self.previousTextViewContentHeight) return;
    
    // 布局
    [self.bottomToolBar mas_updateConstraints:^(MASConstraintMaker *make) {
        //
        make.height.mas_equalTo(toHeight);
        //
    }];
    
    self.previousTextViewContentHeight = toHeight;
    
    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    [UIView animateWithDuration:.25f animations:^{
        // 适当时候更新布局
        [self layoutIfNeeded];
    }];
}

/** textView文字发生改变 */
- (void)textViewWordsDidChange:(YYTextView *)textView
{
    NSString *text = [NSString stringWithFormat:@"%zd/%zd",textView.attributedText.length , JJCommentMaxWords];
    UIFont *font = [UIFont systemFontOfSize:10.0f];
    UIColor *color = textView.attributedText.length <= 300 ? [UIColor grayColor] : [UIColor redColor];
    NSRange range = [text rangeOfString:[NSString stringWithFormat:@"%zd/", textView.attributedText.length]];
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] initWithString:text];
    attributedText.yy_font = font;
    attributedText.yy_color = [UIColor grayColor];
    [attributedText yy_setColor:color range:range];
    self.words.attributedText = attributedText;
}

/** 发送 */
- (void)send
{
    if (self.textView.attributedText.length==0) {
//        [MBProgressHUD mh_showTips:@"回复内容不能为空"];
        return;
    }
    
    if (self.textView.attributedText.length > JJCommentMaxWords) {
//        [MBProgressHUD mh_showTips:@"回复内容超过上限"];
        return;
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(commentInputView:attributedText:)]) {
        // 把内容调回去
        [self.delegate commentInputView:self attributedText:self.textView.text];
    }
    
    // 隐藏
    [self dismissByUser:YES];
}

@end
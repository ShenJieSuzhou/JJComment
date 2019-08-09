//
//  JJTopicHeaderView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/9.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJTopicFrame.h"
#import <YYText/YYText.h>

@class JJTopicHeaderView;
@protocol JJTopicHeaderViewDelegate <NSObject>

@optional

/** 点击头像或昵称的事件回调 */
- (void)topicHeaderViewDidClickedUser:(JJTopicHeaderView *)topicHeaderView;

/** 点击头像或昵称的事件回调 */
- (void)topicHeaderViewDidClickedTopicContent:(JJTopicHeaderView *)topicHeaderView;

/** 用户点击更多按钮 */
- (void)topicHeaderViewForClickedMoreAction:(JJTopicHeaderView *)topicHeaderView;

/** 用户点击点赞按钮 */
- (void)topicHeaderViewForClickedLikeAction:(JJTopicHeaderView *)topicHeaderView;

@end


@interface JJTopicHeaderView : UITableViewHeaderFooterView

+ (instancetype)topicHeaderView;
+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

/** 话题模型数据源 */
@property (nonatomic ,strong) JJTopicFrame *topicFrame;

/** 代理 */
@property (nonatomic ,weak) id <JJTopicHeaderViewDelegate> delegate;

/** 头像 */
@property (nonatomic , weak) UIImageView *avatarView;

/** 昵称 */
@property (nonatomic , weak) YYLabel *nicknameLable;

/** 点赞 */
@property (nonatomic , weak) UIButton *likeBtn;

/** 更多 */
@property (nonatomic , weak) UIButton *moreBtn;

/** 创建时间 */
@property (nonatomic , weak) YYLabel *createTimeLabel;

/** ContentView */
@property (nonatomic , weak) UIView *contentBaseView;

/** 文本内容 */
@property (nonatomic , weak) YYLabel *contentLabel;

@end



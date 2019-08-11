//
//  CommentView.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "CommentView.h"
#import "NSDate+Extension.h"
#import <MJRefresh/MJRefresh.h>

@implementation CommentView
@synthesize  commentTableView = _commentTableView;
@synthesize selecteTopicFrame = _selecteTopicFrame;

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self commonInitlization];
    }
    return self;
}


- (id)init{
    return [self initWithFrame:CGRectZero];
}

- (void)commonInitlization{
    [self addSubview:self.commentTableView];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.commentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self);
    }];
}

#pragma mark - 添加通知中心
- (void)_addNotificationCenter
{
    // 视频评论成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commentSuccess:) name:JJCommentSuccessNotification object:nil];
    
    // 视频评论回复成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commentReplySuccess:) name:JJCommentReplySuccessNotification object:nil];
    
    // 视频点赞成功
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(likeSuccess:) name:JJLikeSuccessNotification object:nil];
}


#pragma mark - 通知事件处理
// 评论成功
- (void)commentSuccess:(NSNotification *)note{

}

// 评论回复成功
- (void)commentReplySuccess:(NSNotification *)note{
    
}

// 话题点赞成功
- (void)likeSuccess:(NSNotificationCenter *)note{

}


/**
 评论的数据容器

 @return 评论
 */
//- (NSMutableArray *)dataSource{
//    if(_dataSource == nil){
//        _dataSource = [[NSMutableArray alloc] init];
//    }
//    return _dataSource;
//}

- (UITableView *)commentTableView{
    if(!_commentTableView){
        _commentTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _commentTableView.delegate = self;
        _commentTableView.dataSource = self;
        _commentTableView.backgroundColor = [UIColor whiteColor];
        _commentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _commentTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
        _commentTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    
    return _commentTableView;
}

// 上拉刷新
- (void)loadData{
    [self.commentTableView.mj_header endRefreshing];
    [self.commentTableView reloadData];
}

// 下拉刷新
- (void)loadMoreData{
    [self.commentTableView.mj_footer endRefreshing];
    [self.commentTableView reloadData];
}


- (void)setDataSource:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
}

//- (JJTopicFrame *)topicFrameWithTopic:(JJTopic *)topic{
//
//    if(topic.commentsCount > 2){
//        JJComment *comment = [[JJComment alloc] init];
//        comment.commentId = @"ALL";
//        comment.text = [NSString stringWithFormat:@"查看全部%zd条回复" , topic.commentsCount];
//        [topic.replayComments addObject:comment];
//    }
//
//    JJTopicFrame *topicFrame = [[JJTopicFrame alloc] init];
//    topicFrame.topic = topic;
//
//    return topicFrame;
//}

// 回复评论
- (void)replyCommentWithCommentReply:(JJCommentReplay *)commentReply{
    JJCommentInputView *inputView = [[JJCommentInputView alloc] initWithFrame:CGRectMake(0, 0, JJMainScreenWidth, 80.0f)];
    inputView.commentReply = commentReply;
    inputView.delegate = self;
    [inputView show];
    
    self.inputPanelView = inputView;
}


#pragma mark - JJCommentInputViewDelegate
- (void)commentInputView:(JJCommentInputView *)inputPanelView attributedText:(NSString *)attributedText{
    // 发送评论
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
        JJComment *comment = [JJComment new];
        comment.postId = self.postId;
        comment.commentId = [NSString stringWithFormat:@"%zd", [self mh_randomNumber:0 to:100]];
        comment.text = attributedText;
        comment.createTime = [NSDate jj_currentTimestamp];
        
        JJUser *fromUser = [[JJUser alloc] init];
        fromUser.userId = @"111111111";
        fromUser.nickname = @"乔布斯";
        fromUser.avatarUrl = @"test";
        
        if(inputPanelView.commentReply.isReply){
            JJUser *toUser = [[JJUser alloc] init];
            toUser.avatarUrl = inputPanelView.commentReply.user.avatarUrl;
            toUser.userId = inputPanelView.commentReply.user.userId;
            toUser.nickname = inputPanelView.commentReply.user.nickname;
            comment.toUser = toUser;
        }
        
//        self.selecteTopicFrame.topic
        
        // 发送评论 回复通知
        
        
    });
}

- (NSInteger) mh_randomNumber:(NSInteger)from to:(NSInteger)to
{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

#pragma mark - tableviewdelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataSource[indexPath.section];
    
    if([model isKindOfClass:[JJTopicFrame class]]){
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        JJCommentFrame *commentFrame = topicFrame.commentFrames[indexPath.row];
        return commentFrame.cellHeight;
    }
    
    return .1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    id model = self.dataSource[section];
    
    if([model isKindOfClass:[JJTopicFrame class]]){
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        return topicFrame.height;
    }
    
    return .1f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    id model = self.dataSource[section];
    
    if([model isKindOfClass:[JJTopicFrame class]]){
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        return topicFrame.commentFrames.count > 0 ? JJTopicVerticalSpace:JJGlobalBottomLineHeight;
    }
    
    return .1f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    JJTopicHeaderView *headerView = [JJTopicHeaderView headerViewWithTableView:tableView];
    JJTopicFrame *topicFrame = self.dataSource[section];
    headerView.topicFrame = topicFrame;
    headerView.delegate = self;
    return headerView;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    JJTopicFooterView *footerView = [JJTopicFooterView footerViewWithTableView:tableView];
    [footerView setSection:section allSections:self.dataSource.count];
    return footerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    id model = self.dataSource[indexPath.section];
    
    if([model isKindOfClass:[JJTopicFrame class]]){
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        JJCommentFrame *commentFrame = topicFrame.commentFrames[indexPath.row];
        self.selecteTopicFrame = topicFrame;
        
        if([commentFrame.comment.commentId isEqualToString:@"AllComment"]){
            // 跳转到更多评论
            return;
        }
        
        
        //回复自己则忽略
//        if()
        
        //回复评论
        JJCommentReplay *commentReply = [[JJTopicManager shareInstance] commentReplyWithModel:commentFrame.comment];
        
        //  显示回复
        [self replyCommentWithCommentReply:commentReply];
    }
}


#pragma mark - tableviewdatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    self.commentTableView.mj_footer.hidden = self.dataSource.count < JJCommentMaxCount;
    
    id model = self.dataSource[section];
    
    if([model isKindOfClass:[JJTopicFrame class]]){
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        return topicFrame.commentFrames.count;
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id model = self.dataSource[indexPath.section];
    
    if([model isKindOfClass:[JJTopicFrame class]]){
        JJCommentCell *cell = [JJCommentCell cellWithTableView:tableView];
        [cell setBackgroundColor:[UIColor redColor]];
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        JJCommentFrame *commentFrame = topicFrame.commentFrames[indexPath.row];
        cell.commentFrame = commentFrame;
        cell.delegate = self;
        return cell;
    }

    return nil;
}



@end

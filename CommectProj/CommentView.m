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
#import "JJCommentDetailController.h"

@implementation CommentView
@synthesize  commentTableView = _commentTableView;
@synthesize selecteTopicFrame = _selecteTopicFrame;
@synthesize decorateHeader = _decorateHeader;
@synthesize commentInputView = _commentInputView;
@synthesize commentContainerV = _commentContainerV;
@synthesize delegate = _delegate;

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
    [self addSubview:self.decorateHeader];
    [self addSubview:self.commentTableView];
    [self addSubview:self.commentContainerV];
    // 放到前面来
    [self.commentContainerV bringSubviewToFront:self.commentTableView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.decorateHeader mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self);
        make.size.mas_equalTo(CGSizeMake([UIScreen mainScreen].bounds.size.width, 25.0f));
    }];
    
    [self.commentTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.decorateHeader.mas_bottom);
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    [self.commentContainerV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.height.mas_equalTo(50.0f);
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

- (JJCommentDecorateHeader *)decorateHeader{
    if(!_decorateHeader){
        _decorateHeader = [[JJCommentDecorateHeader alloc] initWithFrame:CGRectZero];
    }
    return _decorateHeader;
}

- (JJCommentInputView *)commentInputView{
    if(!_commentInputView){
        _commentInputView = [[JJCommentInputView alloc] initWithFrame:CGRectZero];
        _commentInputView.delegate = self;
    }
    return _commentInputView;
}

- (JJCommentContainerView *)commentContainerV{
    if(!_commentContainerV){
        _commentContainerV = [[JJCommentContainerView alloc] initWithFrame:CGRectZero];
        _commentContainerV.delegate = self;
        [_commentContainerV setCommentCount:100];
    }
    return _commentContainerV;
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

// 回复评论
- (void)replyCommentWithCommentReply:(JJCommentReplay *)commentReply{
    JJCommentInputView *inputView = [[JJCommentInputView alloc] initWithFrame:CGRectZero];
    inputView.commentReply = commentReply;
    inputView.delegate = self;
    [inputView show];
}

#pragma mark - JJCommentInputViewDelegate
- (void)commentInputView:(JJTopicFrame *)topicFrame{
    [self.dataSource insertObject:topicFrame atIndex:0];
    [self.commentTableView reloadData];
}

- (void)commentInputView:(JJCommentFrame *)newCommentFrame comment:(JJComment *)comment{
    self.selecteTopicFrame.topic.commentsCount = self.selecteTopicFrame.topic.commentsCount + 1;
    if(self.selecteTopicFrame.topic.commentsCount > 2){
        NSInteger count = self.selecteTopicFrame.commentFrames.count;
        NSInteger index = count - 1;
        [self.selecteTopicFrame.commentFrames insertObject:newCommentFrame atIndex:index];
        [self.selecteTopicFrame.topic.replayComments insertObject:comment atIndex:index];
        
        JJComment *lastComment = self.selecteTopicFrame.topic.replayComments.lastObject;
        lastComment.text = [NSString stringWithFormat:@"查看全部%zd条回复" , self.selecteTopicFrame.topic.commentsCount];
    }else{
        if (self.selecteTopicFrame.topic.replayComments.count == 2)
        {
            // 添加数据源
            [self.selecteTopicFrame.commentFrames addObject:newCommentFrame];
            [self.selecteTopicFrame.topic.replayComments addObject:comment];
            
            // 设置假数据
            JJComment *lastComment = [[JJComment alloc] init];
            lastComment.commentId = @"ALLCOMMENT";
            lastComment.text = [NSString stringWithFormat:@"查看全部%zd条回复" , self.selecteTopicFrame.topic.commentsCount];
            JJCommentFrame *lastCommentFrame =  [[JJTopicManager shareInstance] commentFramesWithComments:@[lastComment]].lastObject;
            // 添加假数据
            [self.selecteTopicFrame.commentFrames addObject:lastCommentFrame];
            [self.selecteTopicFrame.topic.replayComments addObject:lastComment];
        }else{
            // 添加数据源
            [self.selecteTopicFrame.commentFrames addObject:newCommentFrame];
            [self.selecteTopicFrame.topic.replayComments addObject:comment];
        }
    }
    
    [self reloadSelectedSection];
}

- (void)reloadSelectedSection{
    [self.commentTableView beginUpdates];
    NSInteger index = [self.dataSource indexOfObject:self.selecteTopicFrame];
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:index];
    [self.commentTableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    [self.commentTableView endUpdates];
}

#pragma mark - JJCommentContainerViewDelegate
-(void)commentContaninerBtnClickAction:(JJCommentContainerView *)commentContainerView{
    JJCommentInputView *inputView = [[JJCommentInputView alloc] initWithFrame:CGRectZero];
    inputView.delegate = self;
    [inputView setCacheTopicText];
    [inputView show];
}

- (NSInteger) mh_randomNumber:(NSInteger)from to:(NSInteger)to{
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
        
        if([commentFrame.comment.commentId isEqualToString:@"ALLCOMMENT"]){
            // 跳转到更多评论
            [_delegate jumpToCommemtDetailView:topicFrame];
            return;
        }
        
        //回复自己则忽略
//        if([commentFrame.comment.fromUser.userId isEqualToString:@"own"]){
//            return;
//        }
        
        //回复评论
        JJCommentReplay *commentReply = [[JJTopicManager shareInstance] commentReplyWithModel:commentFrame.comment];
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
        JJTopicFrame *topicFrame = (JJTopicFrame *)model;
        JJCommentFrame *commentFrame = topicFrame.commentFrames[indexPath.row];
        cell.commentFrame = commentFrame;
        cell.delegate = self;
        return cell;
    }

    return nil;
}

- (void)topicHeaderViewDidClickedTopicContent:(JJTopicHeaderView *)topicHeaderView{
    self.selecteTopicFrame = topicHeaderView.topicFrame;
    JJCommentReplay *commentReply = [[JJTopicManager shareInstance] commentReplyWithModel:topicHeaderView.topicFrame.topic];
    [self replyCommentWithCommentReply:commentReply];
}

@end

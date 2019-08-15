//
//  JJCommentDetailController.m
//  CommectProj
//
//  Created by shenjie on 2019/8/13.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentDetailController.h"
#import "JJCommentInputView.h"
#import "JJTopicHeaderView.h"
#import "JJTopicFooterView.h"
#import "JJCommentCell.h"
#import "JJTopicManager.h"
#import <MJRefresh.h>
#import <Masonry.h>
#import "JJCommentContainerView.h"
#import "UIView+JJFrame.h"


@interface JJCommentDetailController ()<UITableViewDelegate, UITableViewDataSource, JJTopicHeaderViewDelegate, JJCommentContainerViewDelegate, JJCommentInputViewDelegate, JJCommentCellDelegate>

// 评论表
@property (nonatomic, strong) UITableView *tableView;

// 评论数据
@property (nonatomic, strong) NSMutableArray *commentFrames;

// 底部输入框
@property (nonatomic, strong) JJCommentContainerView *commentContainer;

// 输入框
@property (nonatomic, strong) JJCommentInputView *commentInputView;

// 点赞按钮
@property (nonatomic, strong) UIButton *likeBtn;


@end

@implementation JJCommentDetailController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 标题
    self.title = @"全部回复";
    // 初始化
    [self setUpSubViews];
    
}

- (void)setUpSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.view);
    }];
    
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    header.automaticallyChangeAlpha = YES;
    self.tableView.mj_header = header;

    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    self.tableView.mj_footer = footer;
    
    // 获取模型
    JJTopicHeaderView *headerView = [JJTopicHeaderView topicHeaderView];
    headerView.delegate = self;
    headerView.topicFrame = self.topicFrame;
    headerView.jj_height = self.topicFrame.height;
    // header
    self.tableView.tableHeaderView = headerView;
    
//    // 添加额外区域
//    UIEdgeInsets insets = self.tableView.contentInset;
//    insets.bottom = 55.0f;
//    self.tableView.contentInset = insets;
    
    [self.view addSubview:self.commentContainer];
    // 放到前面来
    [self.commentContainer bringSubviewToFront:self.tableView];
    
//    [self.commentContainer mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(self);
//        make.bottom.mas_equalTo(self.view.mas_bottom);
//        make.height.mas_equalTo(50.0f);
//    }];
}


- (void)setTopicFrame:(JJTopicFrame *)topicFrame{
    _topicFrame = topicFrame;
    _commentFrames = _topicFrame.commentFrames;
}

- (JJCommentContainerView *)commentContainer{
    if(!_commentContainer){
        _commentContainer = [[JJCommentContainerView alloc] initWithFrame:CGRectZero];
        _commentContainer.delegate = self;
        [_commentContainer setCommentCount:100];
    }
    return _commentContainer;
}

/*
 * 加载新数据
 */
- (void)loadNewData{
    [self.tableView.mj_header endRefreshing];
    // 刷新数据
    [self.tableView reloadData];
}

/*
 * 加载新数据
 */
- (void)loadMoreData{
    [self.tableView.mj_footer endRefreshing];
    // 刷新数据
    [self.tableView reloadData];
}

// 回复评论
- (void)replyCommentWithCommentReply:(JJCommentReplay *)commentReply{
    JJCommentInputView *inputView = [[JJCommentInputView alloc] initWithFrame:CGRectZero];
    inputView.commentReply = commentReply;
    inputView.delegate = self;
    [inputView show];
}

#pragma mark - JJCommentCellDelegate
- (void)commentCell:(JJCommentCell *)commentCell didClickUser:(id)user{
    
}

#pragma mark - JJCommentContainerViewDelegate
-(void)commentContaninerBtnClickAction:(JJCommentContainerView *)commentContainerView{
    JJCommentInputView *inputView = [[JJCommentInputView alloc] initWithFrame:CGRectZero];
    inputView.delegate = self;
    [inputView setCacheTopicText];
    [inputView show];
}

#pragma mark - JJCommentInputViewDelegate
- (void)commentInputView:(JJCommentInputView *)inputPanelView attributedText:(NSString *)attributedText{
    
}

- (void)commentInputView:(JJTopicFrame *)topicFrame{
    
}

- (void)commentInputView:(JJCommentFrame *)newCommentFrame comment:(JJComment *)comment{
    
}

#pragma mark - tableviewdelegate
- (CGFloat) tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJCommentFrame *commentFrame = self.commentFrames[indexPath.row];
    return commentFrame.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJCommentFrame *commentFrame = self.commentFrames[indexPath.row];
    return commentFrame.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    JJCommentFrame *commentFrame = self.commentFrames[indexPath.row];

    //回复自己则忽略
    //        if([commentFrame.comment.fromUser.userId isEqualToString:@"own"]){
    //            return;
    //        }

    // 回复评论
    JJCommentReplay *commentReply = [[JJTopicManager shareInstance] commentReplyWithModel:commentFrame.comment];
    [self replyCommentWithCommentReply:commentReply];
}


#pragma mark - tableviewdatasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    self.tableView.mj_footer.hidden = self.commentFrames.count < JJCommentMaxCount;
    return self.commentFrames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JJCommentCell *cell = [JJCommentCell cellWithTableView:tableView];
    JJCommentFrame *commentFrame = self.commentFrames[indexPath.row];
    cell.commentFrame = commentFrame;
    cell.delegate = self;
    return cell;
}

@end

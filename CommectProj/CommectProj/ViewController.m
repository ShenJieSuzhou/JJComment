//
//  ViewController.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "ViewController.h"
#import "JJUser.h"
#import "Works.h"
#import "JJTopic.h"
#import "NSDate+Extension.h"
#import "JJTopicFrame.h"
#import "JJCommentDetailController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *topicFrames;

@end

@implementation ViewController
@synthesize topicFrames = _topicFrames;
@synthesize commentView = _commentView;
//@synthesize commentInputView = _commentInputView;

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"评论";
    self.topicFrames = [[NSMutableArray alloc] init];

    // 测试数据
    NSMutableArray *_users = [NSMutableArray new];
    JJUser *user0 = [[JJUser alloc] init];
    user0.userId = @"1000";
    user0.nickname = @"乔布斯";
    user0.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3258876710,2784921088&fm=179&app=42&f=JPEG?w=121&h=140";
    [_users addObject:user0];
    
    
    JJUser *user1 = [[JJUser alloc] init];
    user1.userId = @"1001";
    user1.nickname = @"李现";
    user1.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=150008462,824781164&fm=58&s=A7DCE46CE45B57D45BC021820300E0C1";
    [_users addObject:user1];
    
    
    JJUser *user2 = [[JJUser alloc] init];
    user2.userId = @"1002";
    user2.nickname = @"肖战";
    user2.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1241282637,2141635065&fm=58&s=BA80AD4CC603455D1B20358A03007091";
    [_users addObject:user2];
    
    
    JJUser *user3 = [[JJUser alloc] init];
    user3.userId = @"1003";
    user3.nickname = @"陈伟霆";
    user3.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2328525025,492417511&fm=58&s=4B0883450E331284192065B30300C043";
    [_users addObject:user3];
    
    
    JJUser *user4 = [[JJUser alloc] init];
    user4.userId = @"1004";
    user4.nickname = @"杨紫";
    user4.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3965879255,1001059869&fm=58&s=50251F704B234A191C4C31D30300C0A2";
    [_users addObject:user4];
    
    
    JJUser *user5 = [[JJUser alloc] init];
    user5.userId = @"1005";
    user5.nickname = @"王一博";
    user5.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2554859985,2945312382&fm=58&s=AB28CB02DCE320866480B08A0300E091";
    [_users addObject:user5];
    
    
    JJUser *user6 = [[JJUser alloc] init];
    user6.userId = @"1006";
    user6.nickname = @"张艺兴";
    user6.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1018086398,1698649337&fm=58&s=C6AABB454A73168C2B1D3D260300E040";
    [_users addObject:user6];
    
    
    JJUser *user7 = [[JJUser alloc] init];
    user7.userId = @"1007";
    user7.nickname = @"刘诗诗";
    user7.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1292713711,2103537245&fm=58&s=D131A83B6F2A77050E646DEB03008021";
    [_users addObject:user7];
    
    
    JJUser *user8 = [[JJUser alloc] init];
    user8.userId = @"1008";
    user8.nickname = @"鹿晗";
    user8.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1231679303,3089912294&fm=58";
    [_users addObject:user8];
    
    
    JJUser *user9 = [[JJUser alloc] init];
    user9.userId = @"1009";
    user9.nickname = @"黄子韬";
    user9.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3108953677,706242964&fm=58&s=3226BA0B881343C4442AFAC30300B0A9";
    [_users addObject:user9];
    
    // 测试评论数据
    NSString *text = @"不忘初心，牢记使命";
    for (int i = 0; i < 30; i++) {
        // 评论
        JJTopic *topic = [[JJTopic alloc] init];
        topic.topicID = [NSString stringWithFormat:@"%d", i];
        topic.likeNums = [self mh_randomNumber:1000 to:100000];
        topic.like = [self mh_randomNumber:0 to:1];
        
        // 假时间
        NSDate *date = [NSDate date];
        NSTimeInterval t = date.timeIntervalSince1970 - 1000 *(30-i) - 60;
        NSDate *d = [NSDate dateWithTimeIntervalSince1970:t];
        NSDateFormatter *formatter = [NSDateFormatter jj_defaultDateFormatter];
        NSString *creatTime = [formatter stringFromDate:d];
        topic.createTime = creatTime;
        topic.text = text;
        topic.user = _users[[self mh_randomNumber:0 to:9]];
        NSInteger commentsCount = [self mh_randomNumber:0 to:20];
        topic.commentsCount = commentsCount;
        NSInteger count = commentsCount > 2 ? 2:commentsCount;
        for (int j = 0; j < count; j++) {
            JJComment *comment = [[JJComment alloc] init];
            comment.commentId = [NSString stringWithFormat:@"0000%d%d%ld", i,j,(long)[self mh_randomNumber:0 to:1000]];
            comment.createTime = [NSDate jj_currentTimestamp];
            comment.text = text;
            
            if (j%3 == 0) {
                JJUser *toUser = _users[[self mh_randomNumber:0 to:5]];
                comment.toUser = toUser;
            }
            
            JJUser *fromUser = _users[[self mh_randomNumber:6 to:9]];
            comment.fromUser = fromUser;
            [topic.replayComments addObject:comment];
        }
        
        [self.topicFrames addObject:[self topicFrameWithTopic:topic]];
    }

    [self.commentView setDataSource:self.topicFrames];
    // 添加评论视图
    [self.view addSubview:self.commentView];
}

- (JJTopicFrame *)topicFrameWithTopic:(JJTopic *)topic{
    if(topic.commentsCount > 2){
        JJComment *comment = [[JJComment alloc] init];
        comment.commentId = @"ALLCOMMENT";
        comment.text = [NSString stringWithFormat:@"查看全部%zd条回复", topic.commentsCount];
        [topic.replayComments addObject:comment];
    }
    
    JJTopicFrame *topicFrame = [[JJTopicFrame alloc] init];
    topicFrame.topic = topic;
    return topicFrame;
}


- (NSInteger) mh_randomNumber:(NSInteger)from to:(NSInteger)to
{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

- (CommentView *)commentView{
    if(!_commentView){
        _commentView = [[CommentView alloc] initWithFrame:CGRectZero];
        _commentView.delegate = self;
        CGFloat offset = getNavAndStatusHight;
        [_commentView setFrame:CGRectMake(0, offset, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - offset)];
    }
    
    return _commentView;
}

//- (JJCommentInputView *)commentInputView{
//    if(!_commentInputView){
//        _commentInputView = [[JJCommentInputView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 60.0f)];
//    }
//    return _commentInputView;
//}

- (void)jumpToCommemtDetailView:(JJTopicFrame *)topicFrame{
    JJCommentDetailController *detailComment = [JJCommentDetailController new];
    detailComment.topicFrame = topicFrame;
    [self.navigationController pushViewController:detailComment animated:YES];
}


@end

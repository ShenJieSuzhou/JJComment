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

@interface ViewController ()

@end

@implementation ViewController
@synthesize commentView = _commentView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 测试数据
    NSMutableArray *_users = [NSMutableArray new];
    JJUser *user0 = [[JJUser alloc] init];
    user0.userId = @"1000";
    user0.nickname = @"乔布斯";
    user0.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1206211006,1884625258&fm=58";
    [_users addObject:user0];
    
    
    JJUser *user1 = [[JJUser alloc] init];
    user1.userId = @"1001";
    user1.nickname = @"吴亦凡";
    user1.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2625917416,3846475495&fm=58";
    [_users addObject:user1];
    
    
    JJUser *user2 = [[JJUser alloc] init];
    user2.userId = @"1002";
    user2.nickname = @"杨洋";
    user2.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=413353707,3948222604&fm=58";
    [_users addObject:user2];
    
    
    JJUser *user3 = [[JJUser alloc] init];
    user3.userId = @"1003";
    user3.nickname = @"陈伟霆";
    user3.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3937650650,3185640398&fm=58";
    [_users addObject:user3];
    
    
    JJUser *user4 = [[JJUser alloc] init];
    user4.userId = @"1004";
    user4.nickname = @"张艺兴";
    user4.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1691925636,1723246683&fm=58";
    [_users addObject:user4];
    
    
    JJUser *user5 = [[JJUser alloc] init];
    user5.userId = @"1005";
    user5.nickname = @"鹿晗";
    user5.avatarUrl = @"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=437161406,3838120455&fm=58";
    [_users addObject:user5];
    
    
    JJUser *user6 = [[JJUser alloc] init];
    user6.userId = @"1006";
    user6.nickname = @"杨幂";
    user6.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1663450221,575161902&fm=58";
    [_users addObject:user6];
    
    
    JJUser *user7 = [[JJUser alloc] init];
    user7.userId = @"1007";
    user7.nickname = @"唐嫣";
    user7.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1655233011,1466773944&fm=58";
    [_users addObject:user7];
    
    
    JJUser *user8 = [[JJUser alloc] init];
    user8.userId = @"1008";
    user8.nickname = @"刘亦菲";
    user8.avatarUrl = @"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=3932899473,3078920054&fm=58";
    [_users addObject:user8];
    
    
    JJUser *user9 = [[JJUser alloc] init];
    user9.userId = @"1009";
    user9.nickname = @"林允儿";
    user9.avatarUrl = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2961367360,923857578&fm=58";
    [_users addObject:user9];
    
    // 测试评论数据
    NSString *text = @"不忘初心，牢记使命";
    Works *testWork = [[Works alloc] initWithPath:nil photoID:@"" userid:@"" work:@"" time:@"" like:@"" nickName:@"" avatar:@"" hasLiked:YES];
    NSInteger commentsCount = [self mh_randomNumber:0 to:40];
    testWork.commentsCount = commentsCount;
    testWork.user = _users[[self mh_randomNumber:0 to:9]];
    
    for (int j = 0; j < commentsCount; j++) {
        JJComment *comment = [[JJComment alloc] init];
        comment.commentId = [NSString stringWithFormat:@"0000%d", j];
        comment.createTime = @"2019-07-08";
        comment.text = text;
        
        if (j%3 == 0) {
            JJUser *toUser = _users[[self mh_randomNumber:0 to:5]];
            comment.toUser = toUser;
        }
        
        JJUser *fromUser = _users[[self mh_randomNumber:6 to:9]];
        comment.fromUser = fromUser;
        [testWork.comments addObject:comment];
    }
    
    //添加数据
    [self.commentView setDataSource:_users];
    // 添加评论视图
    [self.view addSubview:self.commentView];
}

- (NSInteger) mh_randomNumber:(NSInteger)from to:(NSInteger)to
{
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

- (CommentView *)commentView{
    if(!_commentView){
        _commentView = [CommentView new];
        [_commentView setFrame:self.view.frame];
    }
    
    return _commentView;
}


@end

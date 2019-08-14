//
//  JJTopicManager.m
//  CommectProj
//
//  Created by shenjie on 2019/8/7.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJTopicManager.h"
@interface JJTopicManager()



@end

@implementation JJTopicManager
@synthesize commentDictionary = _commentDictionary;
@synthesize replyDictionary = _replyDictionary;
@synthesize topicDictionary = _topicDictionary;

+ (JJTopicManager *)shareInstance{
    static JJTopicManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [JJTopicManager new];
        instance.commentDictionary = [NSMutableDictionary new];
        instance.replyDictionary = [NSMutableDictionary new];
        instance.topicDictionary = [NSMutableDictionary new];
    });
    
    return instance;
}

- (JJCommentReplay *)commentReplyWithModel:(id)model{
    // 回复模型
    JJCommentReplay *commentReply = [[JJCommentReplay alloc] init];
    
    if([model isKindOfClass:[JJTopic class]]){
        // 观点
        JJTopic *topic = (JJTopic *)model;
        commentReply.postId = topic.postId;
        commentReply.commentReplyId = topic.topicID;
        commentReply.text = topic.text;
        commentReply.isReply = NO;
        JJUser *user = [[JJUser alloc] init];
        user.nickname = topic.user.nickname;
        user.avatarUrl = topic.user.avatarUrl;
        user.userId = topic.user.userId;
        commentReply.user = user;
        
        return commentReply;
    }else if([model isKindOfClass:[JJComment class]]){
        JJComment *comment = (JJComment *)model;
        commentReply.text = comment.text;
        commentReply.postId = comment.postId;
        commentReply.commentReplyId = comment.commentId;
        commentReply.isReply = YES;
        // 评论人
        JJUser *user = [[JJUser alloc] init];
        user.nickname = comment.fromUser.nickname;
        user.avatarUrl = comment.fromUser.avatarUrl;
        user.userId = comment.fromUser.userId;
        commentReply.user = user;
        
        return commentReply;
    }
    
    return nil;
}

- (NSArray *)commentFramesWithComments:(NSArray *)comments{
    NSMutableArray *frames = [NSMutableArray new];
    
    for (JJComment *comment in comments) {
        JJCommentFrame *frame = [[JJCommentFrame alloc] init];
        //计算所有子控件的frame
        frame.maxW = [UIScreen mainScreen].bounds.size.width - JJCommentHorizontalSpace*3 - JJTopicAvatarWH;
        frame.comment = comment;
        [frames addObject:frame];
    }
    
    return frames;
}


@end

//
//  JJCommentReplay.h
//  CommectProj
//
//  Created by shenjie on 2019/8/7.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJUser.h"

@interface JJCommentReplay : NSObject

// 回复的哪个帖子
@property (nonatomic, copy) NSString *postId;

// 回复的哪个用户
//@property (nonatomic, strong)

// 要恢复的Id
@property (nonatomic, copy) NSString *commentReplyId;

// 话题内容
@property (nonatomic, copy) NSString *text;

// 回复那个用户
@property (nonatomic, strong) JJUser *user;

// 是否回复
@property (nonatomic, assign) BOOL isReply;

@end


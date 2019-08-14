//
//  JJTopicManager.h
//  CommectProj
//
//  Created by shenjie on 2019/8/7.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJTopicFrame.h"
#import "JJCommentReplay.h"
#import "JJComment.h"
#import "JJCommentFrame.h"
#import "JJCommentConstant.h"

@interface JJTopicManager : NSObject

@property (nonatomic, strong) NSMutableDictionary *commentDictionary;

@property (nonatomic, strong) NSMutableDictionary *replyDictionary;

@property (nonatomic, strong) NSMutableDictionary *topicDictionary;

+ (JJTopicManager *)shareInstance;

- (JJCommentReplay *)commentReplyWithModel:(id)model;

- (NSArray *)commentFramesWithComments:(NSArray *)comments;

@end


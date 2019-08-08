//
//  JJComment.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJComment : NSObject

// 帖子ID
@property (nonatomic, copy) NSString *postId;
// 评论ID
@property (nonatomic, copy) NSString *commentId;
// 创建时间
@property (nonatomic, copy) NSString *createTime;
//评论内容
@property (nonatomic, copy) NSString *text;

//回复用户模型
@property (nonatomic , strong) JJUser *toUser;

//来源用户模型
@property (nonatomic , strong) JJUser *fromUser;

//富文本
- (NSAttributedString *)attributedText;

- (id)initWithPostId:(NSString *)postId
           commentId:(NSString *)commentId
          createTime:(NSString *)createTime
                text:(NSString *)text
              toUser:(JJUser *)toUser
            fromUser:(JJUser *)fromUser;

@end

NS_ASSUME_NONNULL_END

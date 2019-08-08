//
//  JJComment.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJComment.h"
#import <YYText/YYText.h>
#import "JJCommentConstant.h"

@implementation JJComment
@synthesize postId = _postId;
@synthesize commentId = _commentId;
@synthesize createTime = _createTime;
@synthesize text = _text;
@synthesize toUser = _toUser;
@synthesize fromUser = _fromUser;

- (id)initWithPostId:(NSString *)postId
           commentId:(NSString *)commentId
          createTime:(NSString *)createTime
                text:(NSString *)text
              toUser:(JJUser *)toUser
            fromUser:(JJUser *)fromUser{
    
    self = [super init];
    if(self){
        self.postId = postId;
        self.commentId = commentId;
        self.createTime = createTime;
        self.text = text;
        self.toUser = toUser;
        self.fromUser = fromUser;
    }
    
    return self;
}

- (NSAttributedString *)attributedText{
    
    if(self.toUser && self.toUser.nickname.length > 0){
        NSString *textString = [NSString stringWithFormat:@"%@回复%@: %@", self.fromUser.nickname, self.toUser.nickname, self.text];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        mutableAttributedString.yy_font = JJCommentTextFont;
        mutableAttributedString.yy_color = [UIColor blackColor];
        mutableAttributedString.yy_lineSpacing = JJCommentContentLineSpacing;
        
        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickname.length);
        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        fromUserHighlight.userInfo = @{@"JJCommentUserKey":self.fromUser};
        [mutableAttributedString yy_setTextHighlight:fromUserHighlight range:fromUserRange];
        [mutableAttributedString yy_setColor:[UIColor blackColor] range:NSMakeRange(0, self.fromUser.nickname.length)];
        
        NSRange toUserRange = [textString rangeOfString:[NSString stringWithFormat:@"%@:", self.toUser.nickname]];
        YYTextHighlight *toUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        toUserHighlight.userInfo = @{@"JJCommentUserKey":self.toUser};
        [mutableAttributedString yy_setTextHighlight:toUserHighlight range:toUserRange];
        [mutableAttributedString yy_setColor:[UIColor blackColor] range:toUserRange];
        
        return mutableAttributedString;
    }else{
        NSString *textString = [NSString stringWithFormat:@"%@: %@", self.fromUser.nickname, self.text];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithString:textString];
        mutableAttributedString.yy_font = JJCommentTextFont;
        mutableAttributedString.yy_color = [UIColor blackColor];
        mutableAttributedString.yy_lineSpacing = JJCommentContentLineSpacing;
        
        NSRange fromUserRange = NSMakeRange(0, self.fromUser.nickname.length + 1);
        YYTextHighlight *fromUserHighlight = [YYTextHighlight highlightWithBackgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]];
        fromUserHighlight.userInfo = @{@"JJCommentUserKey":self.fromUser};
        [mutableAttributedString yy_setTextHighlight:fromUserHighlight range:fromUserRange];
        
        return mutableAttributedString;
    }
    
    return nil;
}

@end

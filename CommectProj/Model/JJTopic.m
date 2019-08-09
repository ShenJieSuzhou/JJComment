//
//  JJTopic.m
//  CommectProj
//
//  Created by shenjie on 2019/8/7.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJTopic.h"
#import <YYText/YYText.h>
#import "UIFont+JJExtension.h"
#import "JJCommentConstant.h"
#import "NSDate+Extension.h"

@implementation JJTopic
@synthesize postId = _postId;
@synthesize topicID = _topicID;
@synthesize likeNums = _likeNums;
@synthesize createTime = _createTime;
@synthesize text = _text;
@synthesize replayComments = _replayComments;
@synthesize user = _user;
@synthesize commentsCount = _commentsCount;


- (instancetype)init{
    self = [super init];
    if(self){
        _replayComments = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSAttributedString *)attributedText{
    if(!self.text){
        return nil;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:_text];
    attributedString.yy_font = [UIFont systemFontOfSize:15.0f];
    attributedString.yy_color = [UIColor blackColor];
    attributedString.yy_lineSpacing = JJCommentContentLineSpacing;
    return attributedString;
}

- (NSString *)createTime{
    NSDateFormatter *fmt = [NSDateFormatter jj_defaultDateFormatter];
    fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    // 获得发布的具体时间
    NSDate *createDate = [fmt dateFromString:_createTime];
    
    // 判断是否为今年
    if (createDate.jj_isThisYear) {
        if (createDate.jj_isToday) { // 今天
            NSDateComponents *cmps = [createDate jj_deltaWithNow];
            if (cmps.hour >= 1) { // 至少是1小时前发的
                return [NSString stringWithFormat:@"%zd小时前", cmps.hour];
            } else if (cmps.minute >= 1) { // 1~59分钟之前发的
                return [NSString stringWithFormat:@"%zd分钟前", cmps.minute];
            } else { // 1分钟内发的
                return @"刚刚";
            }
        } else if (createDate.jj_isYesterday) { // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return [fmt stringFromDate:createDate];
        } else { // 至少是前天
            fmt.dateFormat = @"MM-dd HH:mm";
            return [fmt stringFromDate:createDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt stringFromDate:createDate];
    }
}


@end

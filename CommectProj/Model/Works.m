//
//  Works.m
//  JJImagePickerDemo
//
//  Created by shenjie on 2018/12/27.
//  Copyright © 2018年 shenjie. All rights reserved.
//

#import "Works.h"

@implementation Works

@synthesize hasLiked = _hasLiked;
@synthesize comments = _comments;
@synthesize commentsCount = _commentsCount;
@synthesize user = _user;

- (instancetype)initWithPath:(NSArray *)path photoID:(NSString *)photoID userid:(NSString *)userid work:(NSString *)work time:(NSString *)postTime like:(NSString *)likes nickName:(NSString *)nickName avatar:(NSString *)avatar hasLiked:(BOOL)hasLiked;{
    self = [super init];
    if(self){
        self.path = [path copy];
        self.photoid = [photoID copy];
        self.userid = [userid copy];
        self.work = [work copy];
        self.postTime = [postTime copy];
        self.likeNum = [likes copy];
        self.hasLiked = hasLiked;
        self.nickName = [nickName copy];
        self.avatar = [avatar copy];
    }
    return self;
}

@end

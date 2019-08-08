//
//  Works.h
//  JJImagePickerDemo
//
//  Created by shenjie on 2018/12/27.
//  Copyright © 2018年 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJUser.h"

@interface Works : NSObject

@property (nonatomic, copy) NSArray *path;

@property (nonatomic, copy) NSString *photoid;

@property (nonatomic, copy) NSString *userid;

@property (nonatomic, copy) NSString *work;

@property (nonatomic, copy) NSString *postTime;

@property (nonatomic, copy) NSString *likeNum;

@property (nonatomic, copy) NSString *nickName;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, strong) NSMutableArray *comments;

@property (nonatomic, assign) NSInteger commentsCount;

@property (assign) BOOL hasLiked;

@property (nonatomic, strong) JJUser *user;

- (instancetype)initWithPath:(NSArray *)path photoID:(NSString *)photoID userid:(NSString *)userid work:(NSString *)work time:(NSString *)postTime like:(NSString *)likes nickName:(NSString *)nickName avatar:(NSString *)avatar hasLiked:(BOOL)hasLiked;

@end



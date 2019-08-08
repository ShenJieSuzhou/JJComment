//
//  JJUser.h
//  CommectProj
//
//  Created by shenjie on 2019/8/8.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJUser : NSObject

/** userId */
@property (nonatomic , copy) NSString *userId;

/** 用户昵称 */
@property (nonatomic , copy) NSString *nickname;

/** 头像地址 */
@property (nonatomic , copy) NSString *avatarUrl;


@end

NS_ASSUME_NONNULL_END

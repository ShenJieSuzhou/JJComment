//
//  NSString+JJSize.h
//  CommectProj
//
//  Created by shenjie on 2019/8/9.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (JJSize)

/**
 *  动态计算文字的宽高（单行）
 *
 *  @param font 文字的字体
 *
 *  @return 计算的宽高
 */
- (CGSize)jj_sizeWithFont:(UIFont *)font;


/**
 *  动态计算文字的宽高（多行）
 *
 *  @param font 文字的字体
 *  @param limitSize 限制的范围
 *
 *  @return 计算的宽高
 */
- (CGSize) jj_sizeWithFont:(UIFont *)font limitSize:(CGSize)limitSize;

/**
 *  动态计算文字的宽高（多行）
 *
 *  @param font 文字的字体
 *  @param width 限制宽度 ，高度不限制
 *
 *  @return 计算的宽高
 */
- (CGSize) jj_sizeWithFont:(UIFont *)font limitWidth:(CGFloat)limitWidth;

@end


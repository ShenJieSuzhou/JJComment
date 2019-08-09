//
//  NSString+JJSize.m
//  CommectProj
//
//  Created by shenjie on 2019/8/9.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "NSString+JJSize.h"


@implementation NSString (JJSize)

/**
 *  动态计算文字的宽高（单行）
 *  @param font 文字的字体
 *  @return 计算的宽高
 */
- (CGSize)jj_sizeWithFont:(UIFont *)font
{
    CGSize theSize;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    theSize = [self sizeWithAttributes:attributes];
    // 向上取整
    theSize.width = ceil(theSize.width);
    theSize.height = ceil(theSize.height);
    return theSize;
}


- (CGSize)jj_sizeWithFont:(UIFont *)font limitSize:(CGSize)limitSize
{
    CGSize theSize;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGRect rect = [self boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    theSize.width = ceil(rect.size.width);
    theSize.height = ceil(rect.size.height);
    return theSize;
}


- (CGSize)jj_sizeWithFont:(UIFont *)font limitWidth:(CGFloat)limitWidth
{
    return [self jj_sizeWithFont:font limitSize:CGSizeMake(limitWidth, MAXFLOAT)];
}

@end

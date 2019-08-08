//
//  UIFont+JJExtension.m
//  CommectProj
//
//  Created by shenjie on 2019/8/8.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "UIFont+JJExtension.h"

/**
 *  极细体
 */
static NSString *const JJPingFangSC_Ultralight = @"PingFangSC-Ultralight";
/**
 *  常规体
 */
static NSString *const JJPingFangSC_Regular = @"PingFangSC-Regular";
/**
 *  中粗体
 */
static NSString *const JJPingFangSC_Semibold = @"PingFangSC-Semibold";
/**
 *  纤细体
 */
static NSString *const JJPingFangSC_Thin = @"PingFangSC-Thin";
/**
 *  细体
 */
static NSString *const JJPingFangSC_Light = @"PingFangSC-Light";
/**
 *  中黑体
 */
static NSString *const JJPingFangSC_Medium = @"PingFangSC-Medium";


@implementation UIFont (JJExtension)

/**
 *  苹方极细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_UltralightFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:JJPingFangSC_Ultralight size:fontSize];
}

/**
 *  苹方常规体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_RegularFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:JJPingFangSC_Regular size:fontSize];
}

/**
 *  苹方中粗体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_SemiboldFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:JJPingFangSC_Semibold size:fontSize];
}

/**
 *  苹方纤细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_ThinFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:JJPingFangSC_Thin size:fontSize];
}

/**
 *  苹方细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_LightFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:JJPingFangSC_Light size:fontSize];
}

/**
 *  苹方中黑体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_MediumFontOfSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:JJPingFangSC_Medium size:fontSize];
}



@end

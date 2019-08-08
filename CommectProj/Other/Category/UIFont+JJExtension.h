//
//  UIFont+JJExtension.h
//  CommectProj
//
//  Created by shenjie on 2019/8/8.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

// IOS版本
#define JJ_IOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])


/// 设置系统的字体大小（YES：粗体 NO：常规）
#define JJFont(__size__,__bold__) ((__bold__)?([UIFont boldSystemFontOfSize:__size__]):([UIFont systemFontOfSize:__size__]))

/// 极细体
#define JJUltralightFont(__size__) ((JJ_IOSVersion<9.0)?JJFont(__size__ , YES):[UIFont JJ_fontForPingFangSC_UltralightFontOfSize:__size__])

/// 纤细体
#define JJThinFont(__size__)       ((JJ_IOSVersion<9.0)?JJFont(__size__ , YES):[UIFont JJ_fontForPingFangSC_ThinFontOfSize:__size__])

/// 细体
#define JJLightFont(__size__)      ((JJ_IOSVersion<9.0)?JJFont(__size__ , YES):[UIFont JJ_fontForPingFangSC_LightFontOfSize:__size__])

// 中等
#define JJMediumFont(__size__)     ((JJ_IOSVersion<9.0)?JJFont(__size__ , YES):[UIFont JJ_fontForPingFangSC_MediumFontOfSize:__size__])

// 常规
#define JJRegularFont(__size__)    ((JJ_IOSVersion<9.0)?JJFont(__size__ , NO):[UIFont JJ_fontForPingFangSC_RegularFontOfSize:__size__])

/** 中粗体 */
#define JJSemiboldFont(__size__)   ((JJ_IOSVersion<9.0)?JJFont(__size__ , YES):[UIFont JJ_fontForPingFangSC_SemiboldFontOfSize:__size__])



/// 苹方常规字体 10
#define JJRegularFont_10 JJRegularFont(10.0f)
/// 苹方常规字体 11
#define JJRegularFont_11 JJRegularFont(11.0f)
/// 苹方常规字体 12
#define JJRegularFont_12 JJRegularFont(12.0f)
/// 苹方常规字体 13
#define JJRegularFont_13 JJRegularFont(13.0f)
/** 苹方常规字体 14 */
#define JJRegularFont_14 JJRegularFont(14.0f)
/// 苹方常规字体 15
#define JJRegularFont_15 JJRegularFont(15.0f)
/// 苹方常规字体 16
#define JJRegularFont_16 JJRegularFont(16.0f)
/// 苹方常规字体 17
#define JJRegularFont_17 JJRegularFont(17.0f)
/// 苹方常规字体 18
#define JJRegularFont_18 JJRegularFont(18.0f)
/// 苹方常规字体 19
#define JJRegularFont_19 JJRegularFont(19.0f)
/// 苹方常规字体 20
#define JJRegularFont_20 JJRegularFont(20.0f)



@interface UIFont (JJExtension)

/**
 *  苹方极细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_UltralightFontOfSize:(CGFloat)fontSize;

/**
 *  苹方常规体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_RegularFontOfSize:(CGFloat)fontSize;

/**
 *  苹方中粗体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_SemiboldFontOfSize:(CGFloat)fontSize;

/**
 *  苹方纤细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_ThinFontOfSize:(CGFloat)fontSize;

/**
 *  苹方细体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_LightFontOfSize:(CGFloat)fontSize;

/**
 *  苹方中黑体
 *
 *  @param fontSize 字体大小
 *
 */
+(instancetype) JJ_fontForPingFangSC_MediumFontOfSize:(CGFloat)fontSize;


@end

NS_ASSUME_NONNULL_END

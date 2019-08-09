//
//  NSDate+Extension.h
//  YBJY
//
//  Created by apple on 16/8/11.
//  Copyright © 2016年 YouBeiJiaYuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+Extension.h"

#define JJ_D_MINUTE	    60
#define JJ_D_HOUR		3600
#define JJ_D_DAY		86400
#define JJ_D_WEEK		604800
#define JJ_D_YEAR		31556926


@interface NSDate (Extension)
/**
 *  是否为今天
 */
- (BOOL)jj_isToday;
/**
 *  是否为昨天
 */
- (BOOL)jj_isYesterday;
/**
 *  是否为今年
 */
- (BOOL)jj_isThisYear;
/**
 *  是否本周
 */
- (BOOL) jj_isThisWeek;

/**
 *  星期几
 */
- (NSString *)jj_weekDay;

/**
 *  是否为在相同的周
 */
- (BOOL) jj_isSameWeekWithAnotherDate: (NSDate *)anotherDate;


/**
 *  通过一个时间 固定的时间字符串 "2016/8/10 14:43:45" 返回时间
 *  @param timestamp 固定的时间字符串 "2016/8/10 14:43:45"
 */
+ (instancetype)jj_dateWithTimestamp:(NSString *)timestamp;

/**
 *  返回固定的 当前时间 2016-8-10 14:43:45
 */
+ (NSString *)jj_currentTimestamp;

/**
 *  返回一个只有年月日的时间
 */
- (NSDate *)jj_dateWithYMD;

/**
 * 格式化日期描述
 */
- (NSString *)jj_formattedDateDescription;

/** 与当前时间的差距 */
- (NSDateComponents *)jj_deltaWithNow;



//////////// MVC&MVVM的商品的发布时间的描述 ////////////
- (NSString *)jj_string_yyyy_MM_dd;
- (NSString *)jj_string_yyyy_MM_dd:(NSDate *)toDate;
//////////// MVC&MVVM的商品的发布时间的描述 ////////////

@end

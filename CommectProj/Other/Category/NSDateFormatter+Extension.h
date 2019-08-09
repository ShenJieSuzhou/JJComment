//
//  NSDateFormatter+Extension.h
//

#import <Foundation/Foundation.h>

@interface NSDateFormatter (Extension)
+ (instancetype)jj_dateFormatter;

+ (instancetype)jj_dateFormatterWithFormat:(NSString *)dateFormat;

+ (instancetype)jj_defaultDateFormatter;/*yyyy/MM/dd HH:mm:ss*/

@end

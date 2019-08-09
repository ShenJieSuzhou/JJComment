//
//  JJTopicFooterView.h
//  CommectProj
//
//  Created by shenjie on 2019/8/9.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJTopicFooterView : UITableViewHeaderFooterView

/** 分割线 */
@property (nonatomic , strong) UIImageView *divider;

/** 第几组 */
@property (nonatomic , assign) NSInteger section;

+ (instancetype)footerViewWithTableView:(UITableView *)tableView;
- (void)setSection:(NSInteger)section allSections:(NSInteger)sections;

@end

NS_ASSUME_NONNULL_END

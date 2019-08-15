//
//  UIView+JJFrame.h
//  CommectProj
//
//  Created by shenjie on 2019/8/15.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JJFrame)

/// < Shortcut for frame.origin.x.
@property (nonatomic, readwrite, assign) CGFloat jj_left;
/// < Shortcut for frame.origin.y
@property (nonatomic, readwrite, assign) CGFloat jj_top;
/// < Shortcut for frame.origin.x + frame.size.width
@property (nonatomic, readwrite, assign) CGFloat jj_right;
/// < Shortcut for frame.origin.y + frame.size.height
@property (nonatomic, readwrite, assign) CGFloat jj_bottom;

/// < Shortcut for frame.origin.x.
@property (nonatomic, readwrite, assign) CGFloat jj_x;
/// < Shortcut for frame.origin.y
@property (nonatomic, readwrite, assign) CGFloat jj_y;
/// < Shortcut for frame.size.width
@property (nonatomic, readwrite, assign) CGFloat jj_width;
/// < Shortcut for frame.size.height
@property (nonatomic, readwrite, assign) CGFloat jj_height;

/// < Shortcut for center.x
@property (nonatomic, readwrite, assign) CGFloat jj_centerX;
///< Shortcut for center.y
@property (nonatomic, readwrite, assign) CGFloat jj_centerY;

/// < Shortcut for frame.size.
@property (nonatomic, readwrite, assign) CGSize jj_size;
/// < Shortcut for frame.origin.
@property (nonatomic, readwrite, assign) CGPoint jj_origin;

@end

NS_ASSUME_NONNULL_END

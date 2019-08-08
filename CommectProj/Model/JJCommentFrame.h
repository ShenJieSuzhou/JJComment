//
//  JJCommentFrame.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "JJComment.h"

@interface JJCommentFrame : NSObject

@property (nonatomic, assign) CGRect textFrame;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, assign) CGFloat maxW;

@property (nonatomic, strong) JJComment *comment;

@end


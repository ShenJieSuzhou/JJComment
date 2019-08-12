//
//  ViewController.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentView.h"
#import "JJCommentInputView.h"

@interface ViewController : UIViewController

@property(nonatomic, strong) CommentView *commentView;

// 评论框
@property(nonatomic, strong) JJCommentInputView *commentInputView;

@end


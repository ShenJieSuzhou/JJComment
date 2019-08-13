//
//  ViewController.h
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentView.h"


@interface ViewController : UIViewController<CommentViewDelegate>

@property(nonatomic, strong) CommentView *commentView;

@end


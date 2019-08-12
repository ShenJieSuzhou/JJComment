//
//  JJCommentCell.m
//  CommectProj
//
//  Created by shenjie on 2019/8/6.
//  Copyright © 2019 shenjie. All rights reserved.
//

#import "JJCommentCell.h"
#import <YYText/YYText.h>
#import "JJCommentConstant.h"

@implementation JJCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"CommentCell";;
    JJCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(!cell){
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }

    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setup];
        
        [self setupSubViews];
    }
    return self;
}

- (void)setup{
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setCommentFrame:(JJCommentFrame *)commentFrame{
    _commentFrame = commentFrame;
    JJComment *comment = commentFrame.comment;
    
    // 位置布局赋值
    self.contentLabel.frame = commentFrame.textFrame;
    self.contentLabel.attributedText = comment.attributedText;
}

- (void)setupSubViews{
    YYLabel *contentLabel = [[YYLabel alloc] init];
    contentLabel.numberOfLines = 0;
    contentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    
    __weak typeof(self) weakSelf = self;
    contentLabel.highlightTapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        
        // KVC
        YYTextHighlight *highlight = [containerView valueForKeyPath:@"highlight"];
        
        if(weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(commentCell:didClickUser:)]){
            [weakSelf.delegate commentCell:weakSelf didClickUser:highlight.userInfo[@"JJCommentUserKey"]];
        }
    };
}

- (void)setFrame:(CGRect)frame{
    frame.origin.x = JJTopicAvatarWH + 2*JJCommentHorizontalSpace;
    frame.size.width = JJMainScreenWidth - frame.origin.x - JJCommentHorizontalSpace;
    [super setFrame:frame];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
}

@end

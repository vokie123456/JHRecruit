//
//  CommentCell.m
//  JHRecruit
//
//  Created by milan on 2017/11/3.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "CommentCell.h"

@interface CommentCell()

@property(nonatomic,strong)UIImageView *headerImgView;
@property(nonatomic,strong)UILabel *nickNameLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *agreeBtn;
@property(nonatomic,strong)UIButton *replyBtn;

@end

@implementation CommentCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setLayout];
      
    }
    return self;
}


-(void)setLayout{
    
    _rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    _rootLayout.myHorzMargin = 0;
    _rootLayout.wrapContentHeight = true;
    _rootLayout.cacheEstimatedRect = true;
    _rootLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [self.contentView addSubview:_rootLayout];
    MyBorderline *line = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
    line.headIndent = 60;
    _rootLayout.bottomBorderline = line;
    
    
    _headerImgView = [UIImageView new];
    _headerImgView.mySize = CGSizeMake(50, 50);
    _headerImgView.layer.cornerRadius = 25;
    _headerImgView.clipsToBounds = true;
    [_rootLayout addSubview:_headerImgView];
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myLeft = 10;
    contentLayout.weight = 1;
    contentLayout.subviewVSpace = 10;
    [_rootLayout addSubview:contentLayout];
    
   
    
    _nickNameLabel = [UILabel new];
    _nickNameLabel.wrapContentSize = true;
    _nickNameLabel.font = [JHTool weightFont:15];
    [contentLayout addSubview:_nickNameLabel];
    
    _contentLabel = [UILabel new];
    _contentLabel.font = [JHTool font:14];
    _contentLabel.wrapContentHeight = true;
    _contentLabel.myHorzMargin = 0;
    [contentLayout addSubview:_contentLabel];
    
    MyLinearLayout *bottomLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    bottomLayout.myHorzMargin = 0;
    bottomLayout.wrapContentHeight = true;
 
    [contentLayout addSubview:bottomLayout];
    
    _agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
     [_agreeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _agreeBtn.titleLabel.font = [JHTool font:13];
    [_agreeBtn setImage:[UIImage imageNamed:@"agreeBtn"] forState:UIControlStateNormal];
    [_agreeBtn addTarget:self action:@selector(agreeBtnClickAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomLayout addSubview:_agreeBtn];
    
    _replyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _replyBtn.titleLabel.font = [JHTool font:13];
    _replyBtn.wrapContentSize = true;
    [_replyBtn setTitle:@"回复" forState:UIControlStateNormal];
    [_replyBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _replyBtn.myLeft = 10;
    [_replyBtn setImage:[UIImage new] forState:UIControlStateNormal];
  
    [bottomLayout addSubview:_replyBtn];
    
    
    
    
    
}

-(void)setModel:(CommentModel *)model{
    _headerImgView.image = [UIImage imageNamed:model.headerIcon];
    
    _nickNameLabel.text = model.userName;
    
    _contentLabel.text = model.commentContent;
    
    [_agreeBtn setTitle:model.agreeNum forState:UIControlStateNormal];
    [_agreeBtn sizeToFit];
    
}

-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    return [self.rootLayout sizeThatFits:targetSize];
}

-(void)agreeBtnClickAction{
    if(self.agreeBtnBlock){
        self.agreeBtnBlock();
    }
}

@end

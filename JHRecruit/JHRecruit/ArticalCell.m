//
//  ArticalCell.m
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "ArticalCell.h"

@interface ArticalCell()
@property(nonatomic,strong)UIImageView *headerImgView;
@property(nonatomic,strong)UILabel *nickeNameLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIImageView *contentImgView;
@property(nonatomic,strong)UILabel *agreeLabel;
@property(nonatomic,strong)UILabel *commentLabel;



@end

@implementation ArticalCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        [self setLayout];
    }
    return self;
}

-(void)setLayout{
    _rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _rootLayout.myHorzMargin = 0;
    _rootLayout.padding = UIEdgeInsetsMake(0, 0, 10, 0);
    _rootLayout.cacheEstimatedRect = true;
    
    [self.contentView addSubview:_rootLayout];
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myHorzMargin = 0;
    contentLayout.backgroundColor = [UIColor whiteColor];
    contentLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    contentLayout.subviewVSpace = 10;
    
    [_rootLayout addSubview:contentLayout];
    
    MyLinearLayout *topLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    topLayout.myHorzMargin = 0;
    topLayout.wrapContentHeight = true;
    [contentLayout addSubview:topLayout];
    
    _headerImgView = [UIImageView new];
    _headerImgView.mySize = CGSizeMake(20, 20);
    _headerImgView.layer.cornerRadius = 10;
    _headerImgView.clipsToBounds = true;
    [topLayout addSubview:_headerImgView];
    
    _nickeNameLabel = [UILabel new];
    _nickeNameLabel.font = [UIFont systemFontOfSize:14];
    _nickeNameLabel.myLeft = 10;
    _nickeNameLabel.wrapContentSize = true;
    _nickeNameLabel.textColor = [UIColor lightGrayColor];
    [topLayout addSubview:_nickeNameLabel];
    
    _titleLabel = [UILabel new];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.myHorzMargin = 0;
    _titleLabel.wrapContentHeight = true;
    [contentLayout addSubview:_titleLabel];
    
    _contentImgView = [UIImageView new];
    _contentImgView.myHorzMargin = 0;
    _contentImgView.myHeight = 150;
    [contentLayout addSubview:_contentImgView];
    
    _contentLabel = [UILabel new];
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.myHorzMargin = 0;
    _contentLabel.wrapContentHeight = true;
    [contentLayout addSubview:_contentLabel];
    
    MyLinearLayout *bottomLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    bottomLayout.myHorzMargin = 0;
    bottomLayout.wrapContentHeight = true;
    [contentLayout addSubview:bottomLayout];
    
    _agreeLabel = [UILabel new];
    _agreeLabel.font = [UIFont systemFontOfSize:14];
    _agreeLabel.textColor = [UIColor lightGrayColor];
    _agreeLabel.wrapContentSize = true;
    [bottomLayout addSubview:_agreeLabel];
    
    _commentLabel = [UILabel new];
    _commentLabel.font = [UIFont systemFontOfSize:14];
    _commentLabel.textColor = [UIColor lightGrayColor];
    _commentLabel.wrapContentSize = true;
    _commentLabel.myLeft = 30;
    [bottomLayout addSubview:_commentLabel];
    
}
-(void)setModel:(ArticalModel *)model{
    
    _headerImgView.image = [UIImage imageNamed:model.headerImg];
    
    _nickeNameLabel.text = model.nickName;
    
    _titleLabel.text = model.titleStr;
    
    _contentLabel.text = model.contentStr;
    
    _agreeLabel.text = [NSString stringWithFormat:@"%@ 赞同",model.agreeNum];
    
    _commentLabel.text = [NSString stringWithFormat:@"%@ 评论",model.commentNum];
    
    if ([model.contentImg isEqualToString:@""]) {
        _contentImgView.hidden = true;
    }else{
        _contentImgView.image = [UIImage imageNamed:model.contentImg];
    }
    
}

-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    return [self.rootLayout sizeThatFits:targetSize];
}

@end

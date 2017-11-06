//
//  TopicCell.m
//  JHRecruit
//
//  Created by milan on 2017/11/6.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "TopicCell.h"
@interface TopicCell()
@property(nonatomic,strong)UIImageView *headerImgView;
@property(nonatomic,strong)UILabel *userLable;
@property(nonatomic,strong)UILabel *toUserLabel;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *replayLabel;
@end

@implementation TopicCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLayout];
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
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
    
    _headerImgView = [[UIImageView alloc]init];
    _headerImgView.mySize = CGSizeMake(30, 30);
    _headerImgView.clipsToBounds = true;
    _headerImgView.layer.cornerRadius = 15;
    [_rootLayout addSubview:_headerImgView];
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.weight = 1;
    contentLayout.myLeft = 10;
    contentLayout.subviewVSpace = 10;
    contentLayout.wrapContentHeight = true;
    [_rootLayout addSubview:contentLayout];
    
    MyBorderline *line = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
  
    contentLayout.bottomBorderline = line;
    
    
    MyLinearLayout *topLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    topLayout.myHorzMargin = 0;
    topLayout.wrapContentHeight = true;
    topLayout.subviewHSpace = 10;
    [contentLayout addSubview:topLayout];
    
    _userLable = [UILabel new];
    _userLable.font = [JHTool weightFont:14];
    _userLable.wrapContentSize = true;
    [topLayout addSubview:_userLable];
    
    _replayLabel = [UILabel new];
    _replayLabel.font = [JHTool font:13];
    _replayLabel.textColor  = [UIColor lightGrayColor];
    _replayLabel.text = @"回复";
    _replayLabel.wrapContentSize = true;
    [topLayout addSubview:_replayLabel];
    
    _toUserLabel = [UILabel new];
    _toUserLabel.font = [JHTool weightFont:14];
    _toUserLabel.wrapContentSize = true;
    [topLayout addSubview:_toUserLabel];
    
    _contentLabel = [UILabel new];
    _contentLabel.myHorzMargin = 0;
    _contentLabel.wrapContentHeight = true;
    _contentLabel.font = [JHTool font:12];
    [contentLayout addSubview:_contentLabel];
    
    
    
    
    
    
    
}

-(void)setModel:(TopicModel *)model{
    _headerImgView.image = [UIImage imageNamed:model.headerIcon];
    
    _userLable.text = model.userName;

    _contentLabel.text = model.replayContent;
    
    if ([model.toUser isEqualToString:@""]) {
        _replayLabel.hidden = true;
        _toUserLabel.hidden = true;
        return;
    }
    _toUserLabel.text = model.toUser;
}
-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    return [self.rootLayout sizeThatFits:targetSize];
    
}
@end

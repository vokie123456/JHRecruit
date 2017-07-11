//
//  liveTableViewCell.m
//  JHRecruit
//
//  Created by milan on 2017/7/9.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "liveTableViewCell.h"
#import "JHTool.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "liveCreater.h"
@implementation liveTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLayout2];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//最低支持IOS8，重载此方法，利用autoLayou，动态计算高度
-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    /*
     调用高度为Wrap的布局师徒的sizeThatFits来获取正式高度
     */
    
    return [self.rootView sizeThatFits:targetSize];
    //如果使用系统自带的分割线，请将返回的高度加一
}

-(void)setLayout
{
    _rootView = [[MyFloatLayout alloc]initWithOrientation:MyOrientation_Vert];
    _rootView.myHorzMargin = 0;
    _rootView.wrapContentHeight = true;
    _rootView.wrapContentWidth = false;
    _rootView.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    _rootView.cacheEstimatedRect = true;
    [self.contentView addSubview:_rootView];
    
    _headerImg = [UIImageView new];
    _headerImg.mySize = CGSizeMake(60, 60);
    [_rootView addSubview:_headerImg];
    
    _nickName = [UILabel new];
    _nickName.font = [JHTool font:15];
    _nickName.textColor = [UIColor redColor];
    _nickName.myLeft = 10;
    _nickName.weight = 1;
    [_rootView addSubview:_nickName];
    
    UILabel *cityLabel = [UILabel new];
    cityLabel.text = @"位置:";
    cityLabel.font = [JHTool font:14];
    [cityLabel sizeToFit];
    cityLabel.myLeft = 10;
    cityLabel.myTop = 5;
    [_rootView addSubview:cityLabel];
    
    _city = [UILabel new];
    _city.font = [JHTool font:14];
    _city.myTop = 5;
    _city.myLeft = 5;
    [_rootView addSubview:_city];
    
    UILabel *numberLabel = [UILabel new];
    numberLabel.font = [JHTool font:14];
    numberLabel.text = @"人数:";
    [numberLabel sizeToFit];
    numberLabel.myTop = 5;
    numberLabel.reverseFloat = true;
    [_rootView addSubview:numberLabel];
    
    _number = [UILabel new];
    _number.font = [JHTool font:14];
    _number.myTop = 5;
    [_rootView addSubview:_number];
    
}

-(void)setLayout2
{
    _rootView = [[MyRelativeLayout alloc]init];
    _rootView.widthSize.equalTo(self.contentView.widthSize);
    _rootView.wrapContentHeight = true;
    _rootView.wrapContentWidth = false;
    _rootView.backgroundColor = [JHTool thisAppBackgroundColor];
    _rootView.padding = UIEdgeInsetsMake(10, 10, 0, 10);
    [self.contentView addSubview:_rootView];
    
    
    MyRelativeLayout *content = [[MyRelativeLayout alloc]init];
    content.widthSize.equalTo(_rootView.widthSize);
    content.wrapContentHeight = true;
    content.wrapContentWidth = false;
    content.backgroundColor = [UIColor whiteColor];
    [_rootView addSubview:content];
    
    _headerImg = [UIImageView new];
    _headerImg.myHeight = 60;
    _headerImg.myWidth = 60;
    [content addSubview:_headerImg];
    
    _nickName = [UILabel new];
    _nickName.leftPos.equalTo(_headerImg.rightPos).offset(10);
    _nickName.font = [JHTool font:14];
    _nickName.textColor = [UIColor redColor];
    [content addSubview:_nickName];
    
    _city = [UILabel new];
    _city.font = [JHTool font:14];
    _city.leftPos.equalTo(_nickName.leftPos);
    _city.bottomPos.equalTo(_headerImg.bottomPos);
    [content addSubview:_city];
    
    _number = [UILabel new];
    _number.font = [JHTool font:14];
    _number.rightPos.equalTo(content.rightPos);
    _number.topPos.equalTo(_city.topPos);
    [content addSubview:_number];
}

-(void)setModel:(LiveModel *)model
{
    
    NSURL *url = [NSURL URLWithString:model.creator.portrait];
    [_headerImg sd_setImageWithURL:url placeholderImage:nil options:SDWebImageRefreshCached];

    _nickName.text = model.creator.nick ;
    [_nickName sizeToFit];
    
    _city.text = model.city;
    [_city sizeToFit];
    
    _number.text = [NSString stringWithFormat:@"%zd",model.online_users];
    [_number sizeToFit];
    
}
@end

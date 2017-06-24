//
//  companyTableViewCell.m
//  JHRecruit
//
//  Created by milan on 2017/6/24.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "companyTableViewCell.h"
#import "JHTool.h"


@implementation companyTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setLayout];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return self;
}
//如果最低支持IOS8，重载此方法动态评估CELL的高度，该方法是autoLayout的方法，用MyLayout布局挑用根布局视图的 sizeThatFits来动态评估获取高度
-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    /*
     *调用高度为Wrap的布局视图的sizeThatFits来获取正式的高度
     
     */
    return [self.rootView sizeThatFits:targetSize];
    //如果使用系统自带的分割线，请将返回的高度+1
}


-(void)setLayout
{
    
    _rootView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    _rootView.widthSize.equalTo(self.contentView.widthSize);
    _rootView.wrapContentHeight = true;
    _rootView.wrapContentWidth = false;
    _rootView.padding = UIEdgeInsetsMake(10, 10, 0, 10);
    _rootView.backgroundColor = [JHTool thisAppBackgroundColor];
    [self.contentView addSubview:_rootView];
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    contentLayout.widthSize.equalTo(_rootView.widthSize);
    contentLayout.wrapContentWidth = false;
    contentLayout.wrapContentHeight = true;
    contentLayout.backgroundColor = [UIColor whiteColor];
    contentLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
  
    [_rootView addSubview:contentLayout];
    
    _headerView = [UIImageView new];
    _headerView.weight = 0.2;
    _headerView.heightSize.equalTo(_headerView.widthSize);
    _headerView.layer.cornerRadius = 5;
    
    [contentLayout addSubview:_headerView];
    
    MyLinearLayout *rightLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    rightLayout.weight = 1;//剩余宽度
    rightLayout.subviewVSpace = 6;
    rightLayout.wrapContentHeight = true;
    rightLayout.myLeft = 10;
    [contentLayout addSubview:rightLayout];
    
    _companyName = [UILabel new];
    _companyName.font = [JHTool font:18];
    
    [rightLayout addSubview:_companyName];
    
    _address = [UILabel new];
    _address.font = [JHTool font:14];
    _address.textColor = [UIColor lightGrayColor];
    [rightLayout addSubview:_address];
    
    MyLinearLayout *infoLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    infoLayout.wrapContentSize = true;
    [rightLayout addSubview:infoLayout];
    
    _type = [UILabel new];
    _type.font = [JHTool font:14];
    _type.textColor = [UIColor lightGrayColor];
    [infoLayout addSubview:_type];
    
    _scale = [UILabel new];
    _scale.font = [JHTool font:14];
    _scale.myLeft = 10;
    _scale.textColor = [UIColor lightGrayColor];
    [infoLayout addSubview:_scale];
    
    UIImageView *nextImg = [UIImageView new];
    nextImg.image = [UIImage imageNamed:@"nextIcon"];
    nextImg.myCenterY = 0;
    [nextImg sizeToFit];
    [contentLayout addSubview:nextImg];
    
    
    
}

-(void)setModel:(companyModel *)model
{
    _headerView.image = [UIImage imageNamed:model.headerImg];
    
    _companyName.text = model.companyName;
    [_companyName sizeToFit];
    
    _address.text = model.address;
    [_address sizeToFit];
    
    _type.text = model.type;
    [_type sizeToFit];
    
    _scale.text = model.scale;
    [_scale sizeToFit];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    }


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   }

@end

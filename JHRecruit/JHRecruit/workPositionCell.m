//
//  workPositionCell.m
//  JHRecruit
//
//  Created by milan on 2017/8/29.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "workPositionCell.h"

@implementation workPositionCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setLayout];
    }
    return self;
}

-(void)setLayout{
    _rootView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _rootView.widthSize.equalTo(self.contentView.widthSize);
    _rootView.backgroundColor = [UIColor clearColor];
    _rootView.padding = UIEdgeInsetsMake(10, 10, 0, 10);
    [self.contentView addSubview:_rootView];
    
    MyRelativeLayout *contentLayout = [MyRelativeLayout new];
    contentLayout.myHorzMargin = 0;
    contentLayout.wrapContentHeight = true;
    contentLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    contentLayout.backgroundColor = [UIColor whiteColor];
    [_rootView addSubview:contentLayout];
    
    UILabel *positionName = [UILabel new];
    positionName.font = [JHTool font:16];
    [contentLayout addSubview:positionName];
    _positionName = positionName;
    
    UILabel *wage = [UILabel new];
    wage.font = [JHTool font:16];
    wage.textColor = [UIColor orangeColor];
    wage.rightPos.equalTo(contentLayout.rightPos);
    [contentLayout addSubview:wage];
    _wage = wage;
    
    UILabel *companyName = [UILabel new];
    companyName.font = [JHTool font:15];
    companyName.textColor = [UIColor lightGrayColor];
    companyName.topPos.equalTo(positionName.bottomPos).offset(10);
    [contentLayout addSubview:companyName];
    _companyName = companyName;
    
    MyLinearLayout *infoLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    infoLayout.wrapContentSize = true;
    infoLayout.topPos.equalTo(companyName.bottomPos).offset(10);
    infoLayout.subviewHSpace = 10;
    [contentLayout addSubview:infoLayout];
    
    UILabel *location = [UILabel new];
    location.font = [JHTool font:14];
    location.textColor = [UIColor lightGrayColor];
    [infoLayout addSubview:location];
    _location = location;
    
    UILabel *education = [UILabel new];
    education.font = [JHTool font:14];
    education.textColor = [UIColor lightGrayColor];
    [infoLayout addSubview:education];
    _education = education;
    
    UILabel *experience = [UILabel new];
    experience.font = [JHTool font:14];
    experience.textColor = [UIColor lightGrayColor];
    [infoLayout addSubview:experience];
    _experience = experience;
   
    
}
-(void)setModel:(positionModel *)model{
    _positionName.text = model.positionName;
    _companyName.text = model.companyName;
    _education.text = model.education;
    _experience.text = model.experience;
    _location.text = model.location;
    _wage.text = model.wage;
    
    
    [_positionName sizeToFit];
    [_companyName sizeToFit];
    [_education sizeToFit];
    [_experience sizeToFit];
    [_location sizeToFit];
    [_wage sizeToFit];
}
-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    return [_rootView sizeThatFits:targetSize];
}
@end

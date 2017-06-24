//
//  persionalTableViewCell.m
//  JHRecruit
//
//  Created by milan on 2017/6/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "persionalTableViewCell.h"
#import "JHTool.h"

#define fontName @"STHeitiSC-Light"

@implementation persionalTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self != nil) {
        [self setLayout];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    return self;
    
}


-(void)setModel:(persionalDataModel *)model{
    
    _headerImg.image = [UIImage imageNamed:model.headerImg];
    
    _nickName.text = model.nickName;
    [_nickName sizeToFit];
    
    _education.text = model.education;
    [_education sizeToFit];
    
    _target.text = model.target;
    [_target sizeToFit];

    
    _experience.text = model.experience;
    [_experience sizeToFit];
    
    _wage.text = model.wage;
    [_wage sizeToFit];
    

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


//如果你的最低支持是IOS8，那么你可以重载这个方法来动态的评估cell 的高度，autoLayout	内部就是通过这个方法来评估高度的，因此如果用MyLayout实现的话就不需要调用基类的方法，而是调用根布局视图的sizeThatFits来评估获取动态的高度.

-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    /*
     *通过布局视图的sizeThatFits方法能够评估出UITableVCiewCell·的动态高度
     sizeThatFits并不会进行布局而只是评估布局的尺寸
     
     因为cell的高度是自适应的，因此这里调用高度为wrap的布局视图的sizeThatFits来获取真实的高度
     
     */

    return [self.rootLayout sizeThatFits:targetSize];//如果使用系统自带的分割线，请记得将返回的高度+1；
}


-(void)setLayout{

    _rootLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    _rootLayout.padding = UIEdgeInsetsMake(10, 10, 0, 10);
    _rootLayout.backgroundColor = [JHTool thisAppBackgroundColor];
    _rootLayout.cacheEstimatedRect = true;
    
    /*
     在UITableViewCell中使用MyLayout中的布局时请将布局视图作为contentView的子视图。如果我们的UITableViewCell的高度是动态的，请务必在将布局视图添加到contentView之前进行如下设置：
     _rootLayout.widthSize.equalTo(self.contentView.widthSize);
     _rootLayout.wrapContentHeight = YES;
     */
    _rootLayout.widthSize.equalTo(self.contentView.widthSize);
    _rootLayout.wrapContentWidth = false;
    _rootLayout.wrapContentHeight = true;
    
    [self.contentView addSubview:_rootLayout];
    
    MyLinearLayout *topContent = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    topContent.wrapContentHeight = true;
    topContent.widthSize.equalTo(_rootLayout.widthSize);
    topContent.backgroundColor = [UIColor whiteColor];
    topContent.padding = UIEdgeInsetsMake(2.5, 5, 2.5, 5);
    [_rootLayout addSubview:topContent];
    
    
    _headerImg = [UIImageView new];
    _headerImg.myWidth = 70;
    _headerImg.myHeight = 80;
    [topContent addSubview:_headerImg];
    
    
    MyLinearLayout *leftContent = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    leftContent.wrapContentWidth = true;
    leftContent.wrapContentHeight = true;
    leftContent.myLeft = 10;
    [topContent addSubview:leftContent];
    
    UILabel *nameLable = [UILabel new];
    nameLable.font = [UIFont fontWithName:fontName size:14];
    nameLable.text = @"姓名:";
    [nameLable sizeToFit];
    [leftContent addSubview:nameLable];
    
    UILabel *educationLable = [UILabel new];
    educationLable.font = [UIFont fontWithName:fontName size:14];
    educationLable.text = @"学历:";
    [educationLable sizeToFit];
    [leftContent addSubview:educationLable];
    
    UILabel *targetLabel = [UILabel new];
    
    targetLabel.font = [UIFont fontWithName:fontName size:14];
    targetLabel.text = @"意向:";
    [targetLabel sizeToFit];
    [leftContent addSubview:targetLabel];
    
    
    MyLinearLayout *rightConteng = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    rightConteng.wrapContentWidth = true;
    rightConteng.wrapContentHeight = true;
    rightConteng.myLeft = 10;
    [topContent addSubview:rightConteng];
    
    _nickName = [UILabel new];
    _nickName.font = [UIFont fontWithName:fontName size:14];
    [rightConteng addSubview:_nickName];
    
    _education = [UILabel new];
    _education.font = [UIFont fontWithName:fontName size:14];

    [rightConteng addSubview:_education];
    
    _target = [UILabel new];
    _target.textColor = [JHTool color:18 widthGreen:150 widthBlue:219 alpha:1];

    _target.font = [UIFont fontWithName:fontName size:14];
   
    [rightConteng addSubview:_target];
    
    UIView *line = [UIView new];
    line.myHeight = 1;
    line.myLeft = 10;
    line.widthSize.equalTo(_rootLayout.widthSize);
    line.backgroundColor = [JHTool color:229 widthGreen:226 widthBlue:226 alpha:0.5];
    [_rootLayout addSubview:line];
    
    MyRelativeLayout *bottomLayout = [MyRelativeLayout new];
    bottomLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
    bottomLayout.widthSize.equalTo(_rootLayout.widthSize);
    bottomLayout.wrapContentHeight = true;
    bottomLayout.backgroundColor = [UIColor whiteColor];
    [_rootLayout addSubview:bottomLayout];
    
    UILabel *experienceLabel = [UILabel new];
    experienceLabel.text = @"工作经验:";
    experienceLabel.font = [JHTool font:14];
    [experienceLabel sizeToFit];
    [bottomLayout addSubview:experienceLabel];
    
    _experience = [UILabel new];
    _experience.font = [JHTool font:14];
    _experience.leftPos.equalTo(experienceLabel.rightPos).offset(10);
    [bottomLayout addSubview:_experience];
    
    _wage = [UILabel new];
    _wage.font = [JHTool font:14];
    _wage.textColor = [UIColor redColor];
    _wage.rightPos.equalTo(bottomLayout.rightPos).offset(10);
    [bottomLayout addSubview:_wage];
    
    UILabel *wageLabel = [UILabel new];
    wageLabel.text = @"理想薪酬:";
    wageLabel.font = [JHTool font:14];
    [wageLabel sizeToFit];
    wageLabel.rightPos.equalTo(_wage.leftPos).offset(10);
    [bottomLayout addSubview:wageLabel];
    
    
    
    

    
}

@end

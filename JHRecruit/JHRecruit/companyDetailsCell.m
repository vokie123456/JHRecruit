//
//  companyDetailsCell.m
//  JHRecruit
//
//  Created by milan on 2017/8/22.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "companyDetailsCell.h"


@implementation companyDetailsCell
-(instancetype)init{
    self = [super init];
    if (self) {
       
        self.orientation = MyOrientation_Horz;
        self.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [self setLayout];
    }
    return self;
}


-(void)setLayout{
    _companyLogo = [UIImageView new];
    _companyLogo.image = [UIImage imageNamed:@"logo1"];
    _companyLogo.mySize = CGSizeMake(60, 60);
    _companyLogo.myCenterY = 0;
    _companyLogo.layer.borderWidth = 0.5;
    _companyLogo.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self addSubview:_companyLogo];
    
    //右边布局
    MyLinearLayout *contentView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentView.wrapContentSize = true;
    contentView.myLeft = 20;
    contentView.subviewVSpace = 5;
    [self addSubview:contentView];
    
    _companyName = [UILabel new];
    _companyName.text = @"糜烂的公司";
    _companyName.font = [JHTool font:16];
    [_companyName sizeToFit];
    [contentView addSubview:_companyName];
    
    _companyLocation = [UILabel new];
    _companyLocation.text = @"广州市天河区XX路";
    _companyLocation.font = [JHTool font:14];
    _companyLocation.textColor = [UIColor lightGrayColor];
    [_companyLocation sizeToFit];
    [contentView addSubview:_companyLocation];
    
    //底部横向视图
    MyLinearLayout *bottomView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    bottomView.wrapContentSize = true;
    bottomView.subviewHSpace = 10;
    [contentView addSubview:bottomView];
    
    _companyType = [UILabel new];
    _companyType.text = @"互联网";
    _companyType.font = [JHTool font:14];
    _companyType.textColor = [UIColor lightGrayColor];
    [_companyType sizeToFit];
    [bottomView addSubview:_companyType];
    
    _companyFinancing = [UILabel new];
    _companyFinancing.text = @"A轮";
    _companyFinancing.font = [JHTool font:14];
    _companyFinancing.textColor = [UIColor lightGrayColor];
    [_companyFinancing sizeToFit];
    [bottomView addSubview:_companyFinancing];
    
    _companySize = [UILabel new];
    _companySize.text = @"100-200人";
    _companySize.font = [JHTool font:14];
    _companySize.textColor = [UIColor lightGrayColor];
    [_companySize sizeToFit];
    [bottomView addSubview:_companySize];
    
    
    
    
    
    
    
 
    
}

@end

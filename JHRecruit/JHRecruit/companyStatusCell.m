//
//  companyStatusCell.m
//  JHRecruit
//
//  Created by milan on 2017/8/27.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "companyStatusCell.h"
@interface companyStatusCell()



@end

@implementation companyStatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        _rootView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        _rootView.widthSize.equalTo(self.contentView.widthSize);
        _rootView.backgroundColor = [UIColor clearColor];
        _rootView.padding = UIEdgeInsetsMake(10, 10, 0, 10);
        [self.contentView addSubview:_rootView];
        
        MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        contentLayout.backgroundColor = [UIColor whiteColor];
        contentLayout.myHorzMargin = 0;
        contentLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [_rootView addSubview:contentLayout];
        self.contentLayout = contentLayout;
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [JHTool font:14];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.text = @"公司概况";
        [titleLabel sizeToFit];
        [contentLayout addSubview:titleLabel];
        
        UILabel *contentLabel = [UILabel new];
        contentLabel.font = [JHTool font:12];
        contentLabel.textColor = [UIColor lightGrayColor];
        contentLabel.numberOfLines = 0;
        contentLabel.myTop = 10;
        contentLabel.myLeft = 0;
        contentLabel.myRight = 0;
        contentLabel.wrapContentHeight = true;
        [contentLayout addSubview:contentLabel];
        self.contentLabel = contentLabel;
        
        UIImageView *iconImgView = [UIImageView new];
        iconImgView.mySize = CGSizeMake(20, 20);
        iconImgView.myCenterX = 0;
        iconImgView.image = [UIImage imageNamed:@"downIcon_HL"];
        [_contentLayout addSubview:iconImgView];
        self.iconImgView = iconImgView;
        
      
        
    }
    return self;
}

-(void)setContentStr:(NSString *)contentStr{
    
    _contentLabel.text = contentStr;
    if (contentStr.length <= 300) {
        _iconImgView.hidden = true;
    }
    
    if (_isShowLabel) {
        [_contentLabel sizeToFit];
    }else{
        self.contentLabel.wrapContentHeight = false;
        self.contentLabel.myHeight = 100;
    }
    
    
}


-(CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority{
    
    return [self.rootView sizeThatFits:targetSize];
}
-(void)setIsShowLabel:(BOOL)isShowLabel{
    _isShowLabel = isShowLabel;
    if (isShowLabel) {
        self.contentLabel.wrapContentHeight = true;
    }else{
        self.contentLabel.wrapContentHeight = false;
        self.contentLabel.myHeight = 100;
    }
    
}
@end

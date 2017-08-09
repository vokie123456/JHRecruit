//
//  JHTextField.m
//  JHRecruit
//
//  Created by milan on 2017/8/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "JHTextField.h"

@implementation JHTextField

-(id)initWithLeftImg:(NSString *)imgName andCornerType:(JHCorenerType)type{
    
    self = [super init];
    if (self) {
        self.ImgName = imgName;
        self.cornerType = type;
        
           }
    return self;
}


-(void)setLeftImgWithImgName:(NSString*)imgName{
    if (imgName == nil) {
        return;
    }
    if (self.leftView != nil) {
        return;
    }
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:imgName];
    imgView.frame = CGRectMake(0, 0, 30, 30);
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = imgView;
}

-(void)setTextFieldCorner:(JHCorenerType)type{
    
    
    if (type == JHCorenerTypeNone) {
        return;
    }
   
    UIBezierPath *maskPath;
    
    
    if (type == JHCorenerTypeTop) {
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(8, 8)];
    }
    
    if (type == JHCorenerTypeBottom) {
        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(8, 8)];
    }
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
   
    
        /*
         **设置边框颜色
         CAShapeLayer *borderkLayer = [CAShapeLayer new];
         borderkLayer.frame = self.bounds;
         borderkLayer.path = maskPath.CGPath;
         borderkLayer.lineWidth = 2.0;
         borderkLayer.strokeColor = [UIColor       lightGrayColor].CGColor;
         borderkLayer.fillColor = [UIColor whiteColor].CGColor;
         [self.layer addSublayer:borderkLayer];

         
         */
    
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self setLeftImgWithImgName:_ImgName];
    [self setTextFieldCorner:_cornerType];
}



@end

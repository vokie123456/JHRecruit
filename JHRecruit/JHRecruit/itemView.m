//
//  itemView.m
//  JHRecruit
//
//  Created by milan on 2017/9/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "itemView.h"

@interface itemView()
@property(nonatomic,strong)UIImageView *imgaeView;
@property(nonatomic,strong)UILabel *label;

@end

@implementation itemView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}



-(instancetype)initWithImg:(UIImage *)img withTitle:(NSString *)title {
    self = [super init];
    if (self) {
        _image = img;
        _title = title;
        
        
        
        
    }
    return self;
    
}
-(void)setLayout{
    self.imgaeView = [UIImageView new];
    _imgaeView.frame = CGRectMake(0, 0, 20, 20);
    _imgaeView.image = _image;
    [self addSubview:_imgaeView];
    
    self.label = [UILabel new];
    _label.text = _title;
    _label.font = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
    _label.frame = CGRectMake(25, 2, 20, 20);
    [_label sizeToFit];
    [self addSubview:_label];
    CGSize size = [_title sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"STHeitiSC-Light" size:16]}];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width+30, 20);
    
    
    
    
}

-(void)setTitle:(NSString *)title{
    
    
    _label.text = title;
    [_label sizeToFit];
    CGSize size = [title sizeWithAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"STHeitiSC-Light" size:16]}];
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width+25, 20);
    
}
-(void)setImage:(UIImage *)image{
    _imgaeView.image = image;
}

-(void)didMoveToSuperview{
    [self setLayout];
}

@end

//
//  HeaderLineView.m
//  HeaderLine
//
//  Created by milan on 2017/8/20.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "HeaderLineView.h"

#define KCWidth [[UIScreen mainScreen]bounds].size.width
@implementation HeaderLineView
-(instancetype)init{
    
    self = [super init];
    if (self) {
        self.selectedTitleColor = [UIColor blackColor];
        self.borderLineColor = [UIColor greenColor];
        buttonArray = [NSMutableArray array];
        _currentIndex = 0;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)setBorderLineColor:(UIColor *)borderLineColor{
   
    bottomLine.backgroundColor = borderLineColor;
    
}
-(void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    
    CGFloat buttonWidth = KCWidth/titleArray.count;
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*buttonWidth, 0, buttonWidth, 44);
        btn.titleLabel.font = [UIFont fontWithName:@"STHeitiSC-Light" size:16];
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.tag = i;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        [buttonArray addObject:btn];
        [self addSubview:btn];
        
        if (i == 0) {
            [btn setTitleColor:self.selectedTitleColor forState:UIControlStateNormal];
            bottomLine = [UIView new];
            bottomLine.frame = CGRectMake(0, 44, buttonWidth, 2);
            bottomLine.backgroundColor = self.borderLineColor;
            [self addSubview:bottomLine];
            
            
        }
        
    }
    
    
}

-(void)btnClickAction:(UIButton*)btn{
    
    if (btn.tag == _currentIndex) {
        return;
    }
    _currentIndex = btn.tag;
    [self setLayout:btn.tag];
    if ([self.delegate respondsToSelector:@selector(didSelectItemWithIndex:)]) {
        [_delegate didSelectItemWithIndex:btn.tag];
    }
    
}

-(void)setCurrentIndex:(NSInteger)currentIndex{
    _currentIndex = currentIndex;
    [self setLayout:currentIndex];
    
    if ([self.delegate respondsToSelector:@selector(didSelectItemWithIndex:)]) {
        [_delegate didSelectItemWithIndex:currentIndex];
    }
    
}

-(void)setLayout:(NSInteger)index{
    if (buttonArray.count==0) {
        return;
    }
    
    UIButton *selectBtn = buttonArray[index];
    [selectBtn setTitleColor:self.selectedTitleColor forState:UIControlStateNormal];
    [UIView animateWithDuration:0.3 animations:^{
        bottomLine.frame = CGRectMake(KCWidth/_titleArray.count*index, 44, KCWidth/buttonArray.count, 2);
    }];
    for (UIButton *btn in buttonArray) {
        if (btn.tag != index) {
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }
    
}

@end

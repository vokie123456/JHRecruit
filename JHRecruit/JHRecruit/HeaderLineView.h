//
//  HeaderLineView.h
//  HeaderLine
//
//  Created by milan on 2017/8/20.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderLineDelegate <NSObject>

@optional
-(void)didSelectItemWithIndex:(NSInteger)index;

@end
@interface HeaderLineView : UIView
{
    NSMutableArray *buttonArray;
    UIView *bottomLine;
   
}
@property(nonatomic,assign) NSInteger currentIndex;
@property (nonatomic , strong) NSArray *titleArray;
@property(nonatomic,strong)id<HeaderLineDelegate> delegate;
@property (nonatomic , strong) UIColor *selectedTitleColor;
@property (nonatomic , strong) UIColor *borderLineColor;
@end

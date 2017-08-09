//
//  JHPickerView.h
//  JHPickerView
//
//  Created by milan on 2017/8/8.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^confirmBlock)(NSArray*contentArray);
typedef void (^cancleBlock)(void);
typedef void (^maskClickAction)(void);

@interface JHPickerView : UIView
@property (nonatomic , strong) UIPickerView *pickerView;
@property (nonatomic , strong) UIView *contentView;
+(JHPickerView*)showJHPickerViewToView:(UIView*)view titleArray:(NSArray*)titleArray contentArray:(NSArray*)contentArray confirmBlock:(confirmBlock)confirmBlock cancelBlock:(cancleBlock)cancleBlock;

@end

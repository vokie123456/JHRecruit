//
//  CountdownView.h
//  DateTest
//
//  Created by milan on 2017/9/16.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^animationFinishBlock) (void);

@interface CountdownView : UIView
@property (nonatomic , strong) UIColor *roundColor;
@property (nonatomic , strong) UIColor *numberColor;
@property (nonatomic , assign) NSInteger seconds;
@property (nonatomic , copy) animationFinishBlock finishBlock;
-(instancetype)initWithSeconds:(NSInteger)seconds animationFinish:(animationFinishBlock)finishBlock;

@end

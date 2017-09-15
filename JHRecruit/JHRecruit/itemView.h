//
//  itemView.h
//  JHRecruit
//
//  Created by milan on 2017/9/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface itemView : UIView
@property (nonatomic , strong) UIImage *image;
@property (nonatomic , strong) NSString *title;

-(instancetype)initWithImg:(UIImage *)img withTitle:(NSString *)title;
@end

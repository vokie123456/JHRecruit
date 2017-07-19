//
//  JHTool.h
//  JHRecruit
//
//  Created by milan on 2017/6/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface JHTool : NSObject

+(UIColor*)color:(int)Red widthGreen:(int)Green widthBlue:(int)Blue alpha:(CGFloat)aplha;

+(UIFont*)font:(CGFloat)size;
+(UIColor*)thisAppBackgroundColor;
+(UIFont *)weightFont:(CGFloat)size;
+(UIColor*)thisAppTintColor;
@end

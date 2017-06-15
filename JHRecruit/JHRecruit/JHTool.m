//
//  JHTool.m
//  JHRecruit
//
//  Created by milan on 2017/6/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "JHTool.h"

@implementation JHTool

+(UIColor *)color:(int)Red widthGreen:(int)Green widthBlue:(int)Blue alpha:(CGFloat)aplha{
    
    return [UIColor colorWithRed:Red/255.0 green:Green/255.0 blue:Blue/255.0 alpha:aplha];

}

+(UIFont*)font:(CGFloat)size{

    return [UIFont fontWithName:@"STHeitiSC-Light" size:size];
}

@end

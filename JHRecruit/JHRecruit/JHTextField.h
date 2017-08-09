//
//  JHTextField.h
//  JHRecruit
//
//  Created by milan on 2017/8/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,JHCorenerType) {
    JHCorenerTypeNone,
    JHCorenerTypeTop,
    JHCorenerTypeBottom
};


@interface JHTextField : UITextField
@property (nonatomic , assign) JHCorenerType cornerType;
@property (nonatomic , strong) UIColor* borderColor;
@property (nonatomic , strong) NSString* ImgName;

-(id)initWithLeftImg:(NSString*)imgName andCornerType:(JHCorenerType)type;


@end

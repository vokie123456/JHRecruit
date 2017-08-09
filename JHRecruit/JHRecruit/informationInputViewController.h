//
//  informationInputViewController.h
//  JHRecruit
//
//  Created by milan on 2017/8/7.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol InformationDelegate <NSObject>

-(void)changeValue:(NSString *)content withTag:(NSUInteger)tag;

@end
@interface informationInputViewController : UIViewController
@property (nonatomic , strong) MyLinearLayout *rootView;
@property (nonatomic , strong) UITextField *textField;
@property (nonatomic , assign) int maxLength;
@property (nonatomic , assign) int currentLength;
@property (nonatomic , strong) UILabel *fontCount;
@property (nonatomic , strong) id<InformationDelegate> delegate;
@property (nonatomic , assign) NSUInteger layoutTag;

@end

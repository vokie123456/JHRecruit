//
//  mainLiveViewController.h
//  JHRecruit
//
//  Created by milan on 2017/7/21.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SocketIO;
@interface mainLiveViewController : UIViewController
@property (nonatomic , strong) UISwitch *beautySwitch;
@property (nonatomic , strong) UISlider *beautyLevel;
@property (nonatomic , strong) UISlider *brightLevel;
@property (nonatomic , strong) MyFloatLayout *beautyView;
@property (nonatomic , strong) SocketIOClient *socketClient;




@end

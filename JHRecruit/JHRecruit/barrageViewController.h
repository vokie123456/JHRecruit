//
//  barrageViewController.h
//  JHRecruit
//
//  Created by milan on 2017/8/1.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "liveConfigDelegate.h"
@import SocketIO;
@interface barrageViewController : UIViewController
@property (nonatomic , strong) MyLinearLayout *toolView;
@property (nonatomic , strong) MyLinearLayout *inputView;
@property (nonatomic , weak) id<liveConfigDelegate> delegate;
@property (nonatomic , strong) SocketIOClient *socketClient;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) UITextField *textField;
@property (nonatomic , strong) UITableView *tabelView;

@end

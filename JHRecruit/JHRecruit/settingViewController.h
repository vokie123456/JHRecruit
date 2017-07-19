//
//  settingViewController.h
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHPlayerView.h"
#import "MyLayout.h"
#import "liveToolView.h"
#import "JHTool.h"
@interface settingViewController : UIViewController
@property(nonatomic,strong)UIButton *liveBtn;
@property(nonatomic,strong)liveToolView *liveView;
@property(nonatomic,strong)UIImageView *headerIcon;
@property(nonatomic,strong)UILabel *nickName;
@property(nonatomic,strong)UILabel *stateLabel;

@end

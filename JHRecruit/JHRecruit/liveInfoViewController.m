//
//  liveInfoViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/21.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "liveInfoViewController.h"

@interface liveInfoViewController ()
@property(nonatomic,strong)UIButton *backBtn;
@property(nonatomic,strong)UIButton *beautyBtn;
@property(nonatomic,strong)UIButton *pictureBtn;
@property(nonatomic,strong)UITextField *titleTextField;
@property(nonatomic,strong)UIButton *startBtn;
@property(nonatomic,strong)UIButton *cameraBtn;
@property(nonatomic,strong)UIButton *startLiveBtn;

@end

@implementation liveInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLayout];
}

-(void)setLayout
{
    
    MyFrameLayout *frameLayout = [[MyFrameLayout alloc]init];
  
    self.view = frameLayout;
    
  
    
    UIButton *beautyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [beautyBtn setBackgroundImage:[UIImage imageNamed:@"beautyIcon"] forState:UIControlStateNormal];
    beautyBtn.myTop = 20;
    beautyBtn.myLeft = 20;
    beautyBtn.mySize = CGSizeMake(40, 40);
    [frameLayout addSubview:beautyBtn];
    self.beautyBtn = beautyBtn;
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraBtn setBackgroundImage:[UIImage imageNamed:@"cameraIcon"] forState:UIControlStateNormal];
    cameraBtn.myTop = 20;
    cameraBtn.myLeft = 70;
    cameraBtn.mySize = CGSizeMake(40, 40);
    [frameLayout addSubview:cameraBtn];
    self.cameraBtn = cameraBtn;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"downIcon"] forState:UIControlStateNormal];
    backBtn.myRight = 20;
    backBtn.myTop = 20;
    backBtn.mySize = CGSizeMake(40, 40);
    [frameLayout addSubview:backBtn];
    self.backBtn = backBtn;
    
    UIButton *pictureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pictureBtn setBackgroundImage:[UIImage imageNamed:@"selectImg"] forState:UIControlStateNormal];
    pictureBtn.myLeft = 20;
    pictureBtn.myTop = 70;
    pictureBtn.mySize = CGSizeMake(100, 100);
    pictureBtn.layer.cornerRadius = 5;
    pictureBtn.clipsToBounds = true;
    [frameLayout addSubview:pictureBtn];
    self.pictureBtn = pictureBtn;
    
    UITextField *titleTextField = [UITextField new];
    titleTextField.myTop = 200;
    titleTextField.myHorzMargin = 0;
    titleTextField.myHeight = 40;
    titleTextField.backgroundColor = [UIColor whiteColor];
    [frameLayout addSubview:titleTextField];
    self.titleTextField = titleTextField;
    
    
    UIButton *startLiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [startLiveBtn setTitle:@"开始直播" forState:UIControlStateNormal];
    startLiveBtn.backgroundColor = [JHTool thisAppTintColor];
    startLiveBtn.myBottom = 150;
    startLiveBtn.myCenterX = 0;
    startLiveBtn.mySize = CGSizeMake(120, 40);
    startLiveBtn.layer.cornerRadius = 5;
    [frameLayout addSubview:startLiveBtn];
    self.startLiveBtn = startLiveBtn;
    
    
    [self.beautyBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    self.beautyBtn.tag = 101;
     [self.backBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    self.backBtn.tag = 102;
     [self.cameraBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    self.cameraBtn.tag = 103;
    
    [self.startLiveBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    self.startLiveBtn.tag = 104;
    
}

-(BOOL)prefersStatusBarHidden
{
    return true;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:true];
}

#pragma mark - 通过按钮方法触发代理
-(void)buttonDelegate:(UIButton *)btn{

    switch (btn.tag) {
        case 101:
            [self.delegate showBeautyView];
            break;
        case 102:
            [self.delegate closeControllerAndStopLive];
            break;
        case 103:
            [self.delegate changeCameraDirection];
            break;
        case 104:
            [self.delegate startLive];
            break;
        default:
            break;
    }
}


@end

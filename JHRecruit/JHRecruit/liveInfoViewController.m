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

@end

@implementation liveInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLayout];
}

-(void)setLayout
{
    
    MyFrameLayout *frameLayout = [[MyFrameLayout alloc]init];
    frameLayout.frame = self.view.frame;
    [self.view addSubview:frameLayout];
    
    UIButton *beautyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [beautyBtn setBackgroundImage:[UIImage imageNamed:@"beautyIcon"] forState:UIControlStateNormal];
    beautyBtn.myTop = 20;
    beautyBtn.myLeft = 20;
    beautyBtn.mySize = CGSizeMake(30, 30);
    frameLayout.backgroundColor = [UIColor whiteColor];
    [frameLayout addSubview:beautyBtn];
    self.beautyBtn = beautyBtn;
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraBtn setBackgroundImage:[UIImage imageNamed:@"cameraIcon"] forState:UIControlStateNormal];
    cameraBtn.myTop = 20;
    cameraBtn.myLeft = 60;
    cameraBtn.mySize = CGSizeMake(30, 30);
    [frameLayout addSubview:cameraBtn];
    self.cameraBtn = cameraBtn;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"downIcon"] forState:UIControlStateNormal];
    backBtn.myRight = 20;
    backBtn.myTop = 20;
    backBtn.mySize = CGSizeMake(30, 30);
    [frameLayout addSubview:backBtn];
    self.backBtn = backBtn;
    
    UIButton *pictureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [pictureBtn setBackgroundImage:[UIImage imageNamed:@"selectImg"] forState:UIControlStateNormal];
    pictureBtn.myLeft = 20;
    pictureBtn.myTop = 60;
    pictureBtn.mySize = CGSizeMake(80, 80);
    pictureBtn.layer.cornerRadius = 5;
    pictureBtn.clipsToBounds = true;
    [frameLayout addSubview:pictureBtn];
    self.pictureBtn = pictureBtn;
    
    UITextField *titleTextField = [UITextField new];
    titleTextField.myTop = 160;
    titleTextField.mySize = CGSizeMake(VIEW_WIDTH, 40);
    titleTextField.backgroundColor = [UIColor whiteColor];
    [frameLayout addSubview:titleTextField];
    self.titleTextField = titleTextField;
    
    
    
}

-(BOOL)prefersStatusBarHidden
{
    return true;
}



@end

//
//  loginViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/20.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "loginViewController.h"
#import "RootViewController.h"
@interface loginViewController ()

@property(nonatomic,strong)UITextField *userTextField;
@property(nonatomic,strong)UITextField *passwordTextField;
@property(nonatomic,strong)UIImageView *logoImage;
@property(nonatomic,strong)UIButton *loginBtn;

@end

@implementation loginViewController
-(void)loadView
{
    [super loadView];
    
    UIImageView *backgroundView = [UIImageView new];
    backgroundView.image = [UIImage imageNamed:@"loginBackground"];
    backgroundView.frame = self.view.frame;
    backgroundView.userInteractionEnabled = true;
    [self.view addSubview:backgroundView];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
    effectView.frame = self.view.frame;
 
    [backgroundView addSubview:effectView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tagGestureAction)];
    tapGesture.numberOfTapsRequired = 1;
    [effectView addGestureRecognizer:tapGesture];
    
    UIImageView *logo = [UIImageView new];
    logo.image = [UIImage imageNamed:@"loginLogo"];
    logo.frame = CGRectMake(self.view.frame.size.width/2-35, self.view.frame.size.height*0.2, 70, 70);
    logo.layer.cornerRadius = 35.0;
    logo.layer.borderColor = [JHTool color:0 widthGreen:168 widthBlue:128 alpha:1].CGColor;
    logo.clipsToBounds = true;
    logo.layer.borderWidth = 2.0;
    [self.view addSubview:logo];
    self.logoImage = logo;
    
  
    
    UITextField *user = [self createTextFieldWithImgName:@"userLogo" withPlaceHold:nil withFrame:CGRectMake(-VIEW_WIDTH*0.6, logo.frame.origin.y+130, VIEW_WIDTH*0.6, 40)];
    [self.view addSubview:user];
    self.userTextField = user;
    
    UITextField *password = [self createTextFieldWithImgName:@"passwordLogo" withPlaceHold:nil withFrame:CGRectMake(-VIEW_WIDTH*0.6, user.frame.origin.y+50, VIEW_WIDTH*0.6, 40)];
    password.secureTextEntry = true;
    [self.view addSubview:password];
    self.passwordTextField = password;
    
    user.backgroundColor = [UIColor whiteColor];
    password.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(VIEW_WIDTH*0.2, self.passwordTextField.frame.origin.y+60, VIEW_WIDTH*0.6, 40);
    loginBtn.backgroundColor = [JHTool thisAppTintColor];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = true;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        [self textFieldAnimation];
}

-(void)textFieldAnimation
{
    
    
    [UIView animateWithDuration:1 delay:0.8 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.userTextField.frame = CGRectMake(VIEW_WIDTH*0.2, self.logoImage.frame.origin.y+130, VIEW_WIDTH*0.6, 40);
        
        self.passwordTextField.frame = CGRectMake(VIEW_WIDTH*0.2, self.userTextField.frame.origin.y+50, VIEW_WIDTH*0.6, 40);
       
      
        
    } completion:^(BOOL finished) {
       
        
    }];
    
    [UIView animateWithDuration:0.8 animations:^{
         self.loginBtn.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            self.loginBtn.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];

    }];
    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    
//    // 动画选项的设定
//    animation.duration = 1.0; // 持续时间
//    animation.repeatCount = 1; // 重复次数
//    animation.timingFunction;
//    
//    animation.fromValue = [NSNumber numberWithFloat:1.0]; // 开始时的倍率
//    animation.toValue = [NSNumber numberWithFloat:1.5]; // 结束时的倍率
//    // 添加动画
//    [self.loginBtn.layer addAnimation:animation forKey:@"move-layer"];
}

-(UITextField *)createTextFieldWithImgName:(NSString*)imgName withPlaceHold:(NSString *)placeHold withFrame:(CGRect)frame
{
    UITextField *textFiled = [UITextField new];
    textFiled.layer.cornerRadius = 5;
    textFiled.clipsToBounds = true;
    textFiled.frame = frame;
    
    UIImageView *leftImg = [UIImageView new];
    leftImg.frame = CGRectMake(0, 0, 30, 30);
    leftImg.image = [UIImage imageNamed:imgName];
    
    textFiled.leftView = leftImg;
    textFiled.leftViewMode = UITextFieldViewModeAlways;
    
    
    return textFiled;
}


-(void)tagGestureAction
{
    [self.view endEditing:true];
 
}

-(void)loginClick
{
    RootViewController *root = [[RootViewController alloc]init];
    [self.navigationController pushViewController:root animated:false];
}


@end

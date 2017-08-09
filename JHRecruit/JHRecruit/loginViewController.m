//
//  loginViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/20.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "loginViewController.h"
#import "RootViewController.h"
#import "JHTextField.h"
#import "registViewController.h"
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
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight]];
    effectView.frame = self.view.frame;
 
    [backgroundView addSubview:effectView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tagGestureAction)];
    tapGesture.numberOfTapsRequired = 1;
    [effectView addGestureRecognizer:tapGesture];
    
    UIImageView *logo = [UIImageView new];
    logo.image = [UIImage imageNamed:@"loginLogo"];
    logo.frame = CGRectMake(VIEW_WIDTH/2-50, VIEW_HEIGHT*0.2, 100, 100);
    logo.layer.cornerRadius = 50.0;
    logo.layer.borderColor = [JHTool color:0 widthGreen:168 widthBlue:128 alpha:1].CGColor;
    logo.clipsToBounds = true;
    logo.layer.borderWidth = 2.0;
    [self.view addSubview:logo];
    self.logoImage = logo;
    
    
    JHTextField *user = [[JHTextField alloc]initWithLeftImg:@"userLogo" andCornerType:JHCorenerTypeTop];
    user.clearButtonMode = UITextFieldViewModeWhileEditing;
    user.backgroundColor = [UIColor whiteColor];
    user.frame = CGRectMake(-VIEW_WIDTH*0.8, logo.frame.origin.y+130, VIEW_WIDTH*0.8, 50);
    user.placeholder = @"请输入账号..";
    [self.view addSubview:user];
    self.userTextField = user;
    
    JHTextField *password = [[JHTextField alloc]initWithLeftImg:@"passwordLogo" andCornerType:JHCorenerTypeBottom];
    password.clearButtonMode = UITextFieldViewModeWhileEditing;
    password.frame = CGRectMake(-VIEW_WIDTH*0.8, user.frame.origin.y+50, VIEW_WIDTH*0.8, 50);
    password.backgroundColor = [UIColor whiteColor];
    password.secureTextEntry = true;
    password.placeholder = @"请输入密码..";
    [self.view addSubview:password];
    self.passwordTextField = password;
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.frame = CGRectMake(VIEW_WIDTH*0.1, self.passwordTextField.frame.origin.y+80, VIEW_WIDTH*0.8, 45);
    loginBtn.backgroundColor = [JHTool thisAppTintColor];
    loginBtn.layer.cornerRadius = 5;
    [loginBtn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"注册账号" forState:UIControlStateNormal];
    registBtn.frame = CGRectMake(VIEW_WIDTH-100, VIEW_HEIGHT-50, 80, 30);
    registBtn.titleLabel.font = [JHTool font:14];
    [registBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    registBtn.backgroundColor = [UIColor lightTextColor];
    registBtn.layer.cornerRadius = 10;
    [registBtn addTarget:self action:@selector(registNewAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    
    UIButton *forgetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [forgetBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    forgetBtn.frame = CGRectMake(20, VIEW_HEIGHT-50, 80, 30);
    forgetBtn.titleLabel.font = [JHTool font:14];
    [forgetBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    forgetBtn.layer.cornerRadius = 10;
    [self.view addSubview:forgetBtn];
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [JHTool thisAppTintColor];
    UIImage *backImg = [[UIImage imageNamed:@"backIcon"]resizableImageWithCapInsets:UIEdgeInsetsMake(0, 30, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backImg forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //隐藏返回按钮的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];

    
    

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:true animated:true];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        [self textFieldAnimation];
}

-(void)textFieldAnimation
{
    
    
    [UIView animateWithDuration:1 delay:0.8 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.userTextField.frame = CGRectMake(VIEW_WIDTH*0.1, self.logoImage.frame.origin.y+130, VIEW_WIDTH*0.8, 50);
        
        self.passwordTextField.frame = CGRectMake(VIEW_WIDTH*0.1, self.userTextField.frame.origin.y+50, VIEW_WIDTH*0.8, 50);
       
      
        
    } completion:^(BOOL finished) {
       
        
    }];
    
    
    

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
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    UINavigationController *oldNav = (UINavigationController *)window.rootViewController;
    
    RootViewController *root = [[RootViewController alloc]init];
    [[UIApplication sharedApplication]keyWindow].rootViewController = root;
    [oldNav popViewControllerAnimated:false];
    oldNav.viewControllers = [NSArray new];
    oldNav = nil;
    

}

-(void)registNewAccount{
    registViewController *regist = [[registViewController alloc]init];
    [self.navigationController pushViewController:regist animated:true];
    
}

@end

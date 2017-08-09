//
//  registViewController.m
//  JHRecruit
//
//  Created by milan on 2017/8/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "registViewController.h"
#import "JHTextField.h"
#import "createResumeViewController.h"
@interface registViewController ()

@end

@implementation registViewController
-(void)loadView{
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
    
    JHTextField *userTextField = [[JHTextField alloc]initWithLeftImg:@"userLogo" andCornerType:JHCorenerTypeTop];
    userTextField.frame = CGRectMake(VIEW_WIDTH*0.1, VIEW_HEIGHT*0.3, VIEW_WIDTH*0.8, 50);
    userTextField.backgroundColor = [UIColor whiteColor];
    userTextField.placeholder = @"请输入账号..";
    [self.view addSubview:userTextField];
    
    JHTextField *pwTextField = [[JHTextField alloc]initWithLeftImg:@"passwordLogo" andCornerType:JHCorenerTypeNone];
    pwTextField.secureTextEntry = true;
    pwTextField.backgroundColor = [UIColor whiteColor];
    pwTextField.placeholder = @"请输入密码..";
    pwTextField.frame = CGRectMake(VIEW_WIDTH*0.1, userTextField.frame.origin.y+50, VIEW_WIDTH*0.8, 50);
    [self.view addSubview:pwTextField];
    
    JHTextField *secondPW = [[JHTextField alloc]initWithLeftImg:@"passwordLogo" andCornerType:JHCorenerTypeBottom];
    secondPW.secureTextEntry = true;
    secondPW.backgroundColor = [UIColor whiteColor];
    secondPW.placeholder = @"请确认密码..";
    secondPW.frame = CGRectMake(VIEW_WIDTH*0.1, pwTextField.frame.origin.y+50, VIEW_WIDTH*0.8, 50);
    [self.view addSubview:secondPW];
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [registBtn setTitle:@"注册" forState:UIControlStateNormal];
    registBtn.backgroundColor = [JHTool thisAppTintColor];
    registBtn.frame = CGRectMake(VIEW_WIDTH*0.1, secondPW.frame.origin.y+100, VIEW_WIDTH*0.8, 45);
    registBtn.layer.cornerRadius = 5;
    [registBtn addTarget:self action:@selector(registAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    userTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    secondPW.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:false animated:true];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)tagGestureAction
{
    [self.view endEditing:true];
    
}
-(void)registAccount{
    createResumeViewController *resume = [[createResumeViewController alloc]init];
    [self.navigationController pushViewController:resume animated:true];
}

@end

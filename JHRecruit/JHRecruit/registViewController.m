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
#import "UserManager.h"
#import "SVProgressHUD.h"

@interface registViewController ()
@property(nonatomic,strong)UITextField *userTextField;
@property(nonatomic,strong)UITextField *pwTextField;
@property(nonatomic,strong)UITextField *secondPW;

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
    self.userTextField = userTextField;
    
    
    JHTextField *pwTextField = [[JHTextField alloc]initWithLeftImg:@"passwordLogo" andCornerType:JHCorenerTypeNone];
    pwTextField.secureTextEntry = true;
    pwTextField.backgroundColor = [UIColor whiteColor];
    pwTextField.placeholder = @"请输入密码..";
    pwTextField.frame = CGRectMake(VIEW_WIDTH*0.1, userTextField.frame.origin.y+50, VIEW_WIDTH*0.8, 50);
    [self.view addSubview:pwTextField];
    self.pwTextField = pwTextField;
    
    JHTextField *secondPW = [[JHTextField alloc]initWithLeftImg:@"passwordLogo" andCornerType:JHCorenerTypeBottom];
    secondPW.secureTextEntry = true;
    secondPW.backgroundColor = [UIColor whiteColor];
    secondPW.placeholder = @"请确认密码..";
    secondPW.frame = CGRectMake(VIEW_WIDTH*0.1, pwTextField.frame.origin.y+50, VIEW_WIDTH*0.8, 50);
    [self.view addSubview:secondPW];
    self.secondPW = secondPW;
    
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
    
     

}

-(void)tagGestureAction
{
    [self.view endEditing:true];
    
}
-(void)registAccount{
    self.view.userInteractionEnabled = false;
    
    if ([_userTextField.text isEqualToString:@""]||[_pwTextField.text isEqualToString:@""]||[_secondPW.text isEqualToString:@""]) {
        [SVProgressHUD showInfoWithStatus:@"请确认信息完整!"];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD dismissWithDelay:1.5 completion:^{
            self.view.userInteractionEnabled = true;
        }];
        return;
    }
    
    if (![_pwTextField.text isEqualToString:_secondPW.text]) {
        [SVProgressHUD showInfoWithStatus:@"请确认两次输入的密码相等!"];
        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
        [SVProgressHUD dismissWithDelay:1.5 completion:^{
             self.view.userInteractionEnabled = true;
        }];
        return;
    }
    
    [SVProgressHUD showWithStatus:@"loading"];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    
    UserManager *manager = [UserManager shareManager];
    [manager postRegistInfoWithUid:_userTextField.text password:_pwTextField.text success:^{
        [SVProgressHUD dismiss];
        createResumeViewController *resume = [[createResumeViewController alloc]init];
        [self.navigationController pushViewController:resume animated:true];
        
        
    } fail:^{
        [SVProgressHUD dismiss];
        [SVProgressHUD showErrorWithStatus:@"用户已存在!"];
        [SVProgressHUD dismissWithDelay:1.5 completion:^{
            self.view.userInteractionEnabled = true;
        }];
    }];
    
    
    
}

@end

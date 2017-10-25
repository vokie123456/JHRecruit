//
//  RootViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "RootViewController.h"
#import "persionalViewController.h"
#import "companyTableViewController.h"
#import "liveViewController.h"
#import "settingViewController.h"
#import "ArticleViewController.h"
#import "JHNavigationController.h"
#import "JHTool.h"




#import "JHTool.h"
@interface RootViewController ()

@end

@implementation RootViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden= true;
}




- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];


    persionalViewController *persional = [[persionalViewController alloc]init];
    JHNavigationController *persionalNav = [[JHNavigationController alloc]initWithRootViewController:persional];
    
    companyTableViewController *company = [[companyTableViewController alloc]init];
    JHNavigationController *companyNav = [[JHNavigationController alloc]initWithRootViewController:company];
    
    liveViewController *live = [[liveViewController alloc]init];
    JHNavigationController *liveNav = [[JHNavigationController alloc]initWithRootViewController:live];
    
    ArticleViewController *article = [ArticleViewController new];
    JHNavigationController *articleNav = [[JHNavigationController alloc]initWithRootViewController:article];
    
    settingViewController *setting = [[settingViewController alloc]init];
     JHNavigationController *settingNav = [[JHNavigationController alloc]initWithRootViewController:setting];
    
    self.viewControllers = @[persionalNav,companyNav, liveNav, articleNav,settingNav];
    
    [self setTabBar];
    
   
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTabBar{
    self.tabBar.translucent = false;
    [self.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (idx) {
            case 0:
                [self setItem:obj andImgName:@"persional" andSlectImgName:@"persional_hl" andTitle:@"个人"];
                
                break;
            case 1:
                [self setItem:obj andImgName:@"company" andSlectImgName:@"company_hl" andTitle:@"公司"];
                
                break;
            case 2:
                [self setItem:obj andImgName:@"live" andSlectImgName:@"live_hl" andTitle:@"直播"];
            
                                break;
            case 3:
                [self setItem:obj andImgName:@"article" andSlectImgName:@"article_hl" andTitle:@"社区"];
                
                break;
                
            case 4:
                [self setItem:obj andImgName:@"setting" andSlectImgName:@"setting_hl" andTitle:@"我的"];
               
                
            default:
                break;
        }
    }];
    
    //修改文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[[UIColor blackColor] colorWithAlphaComponent:0.5], NSForegroundColorAttributeName, [UIFont systemFontOfSize:12], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    UIColor *titleHighlightedColor = [JHTool thisAppTintColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:13], NSFontAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

-(void)setItem:(UIViewController *)VC andImgName:(NSString *)img andSlectImgName:(NSString *)secondImg andTitle:(NSString *)title{
    
    VC.tabBarItem.image = [[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:secondImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.title = title;
    
}



@end

//
//  RootViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "RootViewController.h"
#import "persionalViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
 
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];

//    recruitViewController *recruit = [[recruitViewController alloc]init];
    persionalViewController *persional = [[persionalViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:persional];
    
    
    discoverViewController *discover = [[discoverViewController alloc]init];
    liveViewController *live = [[liveViewController alloc]init];
    
    settingViewController *setting = [[settingViewController alloc]init];
    
    self.viewControllers = @[nav1,discover,live,setting];
    
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
                [self setItem:obj andImgName:@"recruit" andSlectImgName:@"recruit_hl" andTitle:@"招聘"];
                
                break;
            case 1:
                [self setItem:obj andImgName:@"discover" andSlectImgName:@"discover_hl" andTitle:@"发现"];
                obj.view.backgroundColor = [UIColor purpleColor];
                break;
            case 2:
                [self setItem:obj andImgName:@"live" andSlectImgName:@"live_hl" andTitle:@"直播"];
                obj.view.backgroundColor = [UIColor redColor];
                break;
            case 3:
                [self setItem:obj andImgName:@"setting" andSlectImgName:@"setting_hl" andTitle:@"个人"];
                obj.view.backgroundColor = [UIColor greenColor];
                
            default:
                break;
        }
    }];
    
    //修改文字颜色
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[[UIColor blackColor] colorWithAlphaComponent:0.5], NSForegroundColorAttributeName, [UIFont systemFontOfSize:13], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    UIColor *titleHighlightedColor = [UIColor colorWithRed:84/255.0 green:1.0 blue:159/255.0 alpha:1];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: titleHighlightedColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:13], NSFontAttributeName,
                                                       nil] forState:UIControlStateSelected];
}

-(void)setItem:(UIViewController *)VC andImgName:(NSString *)img andSlectImgName:(NSString *)secondImg andTitle:(NSString *)title{
    
    VC.tabBarItem.image = [[UIImage imageNamed:img] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ;
    VC.tabBarItem.selectedImage = [[UIImage imageNamed:secondImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    VC.tabBarItem.title = title;
    
}



@end

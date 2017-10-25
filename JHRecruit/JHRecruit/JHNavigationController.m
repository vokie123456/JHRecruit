//
//  JHNavigationController.m
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "JHNavigationController.h"

@interface JHNavigationController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation JHNavigationController

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.barTintColor = [JHTool thisAppTintColor];
    
    self.navigationBar.shadowImage = [UIImage new];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    [UINavigationBar appearance].barStyle = UIBarStyleBlack;
    
    __weak typeof(self) weakSelf = self;
    self.interactivePopGestureRecognizer.delegate = weakSelf;
    self.delegate  = weakSelf;
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.viewControllers.count>0) {
//        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        backBtn.frame=CGRectMake(0, 0, 40, 40);
//        [backBtn setBackgroundImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
//        [backBtn addTarget:self action:@selector(popViewController) forControlEvents:UIControlEventTouchUpInside];
//        UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
//        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//        spaceItem.width = -100;
//        viewController.navigationItem.leftBarButtonItems = @[barItem,spaceItem];
       
        
       
        
        
         
    }
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated == true) {
        [self.interactivePopGestureRecognizer setEnabled:false];
        
    }
    [super pushViewController:viewController animated:animated];
    
}

-(NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        [self.interactivePopGestureRecognizer setEnabled:false];
    }
    return [self popToRootViewControllerAnimated:true];
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
     viewController.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    viewController.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
   
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        [self.interactivePopGestureRecognizer setEnabled:true];
    }
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.viewControllers.count<2 || self.visibleViewController == self.viewControllers[0]) {
        return false;
    }
    return true;
}

- (void)popViewController{
    [self popViewControllerAnimated:true];
}


@end

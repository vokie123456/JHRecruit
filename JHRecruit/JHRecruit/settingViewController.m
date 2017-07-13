//
//  settingViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "settingViewController.h"
#import "JHPlayerView.h"
#import "MyLayout.h"
#import "liveToolView.h"
#import "JHTool.h"
@interface settingViewController ()
@property(nonatomic,strong)UIButton *liveBtn;
@property(nonatomic,strong)liveToolView *liveView;

@end

@implementation settingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _liveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _liveBtn.frame = CGRectMake(0, 0, 50, 50);
    _liveBtn.center = self.view.center;
    _liveBtn.backgroundColor = [UIColor redColor];
    [_liveBtn setTitle:@"点击" forState:UIControlStateNormal];
    [_liveBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_liveBtn];
    
    _liveView = [[liveToolView alloc]init];
    _liveView.frame = self.view.frame;
    _liveView.useFrame = true;
    _liveView.hidden = true;
    [self.view addSubview:_liveView];
    
    
    
    
    
    
    
   }

-(void)btnClick
{
    _liveView.hidden = false;
 
}

-(void)hideView
{
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

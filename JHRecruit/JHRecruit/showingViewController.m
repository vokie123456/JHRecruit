//
//  showingViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/10.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "showingViewController.h"
#import "JHPlayerView.h"

@interface showingViewController ()
@property(nonatomic,strong)JHPlayerView *playerView;
@end

@implementation showingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _playerView = [[JHPlayerView alloc]initWithUrl:[NSURL URLWithString:_streamAddress] withPlayerType:live];
    self.view = _playerView;
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"backIcon"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(10, 10, 30, 30);
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(closeController) forControlEvents:UIControlEventTouchUpInside];
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

-(void)closeController
{
    [_playerView.ijkPlayer stop];
    [_playerView.ijkPlayer shutdown];
    [self dismissViewControllerAnimated:true completion:nil];

}
@end

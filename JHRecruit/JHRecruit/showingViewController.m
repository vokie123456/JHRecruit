//
//  showingViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/10.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "showingViewController.h"
#import "JHPlayerView.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface showingViewController ()
@property(nonatomic,strong)JHPlayerView *playerView;
@end

@implementation showingViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    
    UIImageView *backgroundView = [UIImageView new];
    NSURL *url = [NSURL URLWithString:self.backgrondImg];
    [backgroundView sd_setImageWithURL:url];
    backgroundView.frame = self.view.frame;
    [self.view addSubview:backgroundView];
    
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    effectView.frame = self.view.frame;
    [backgroundView addSubview:effectView];
    
    _playerView = [[JHPlayerView alloc]initWithUrl:[NSURL URLWithString:_streamAddress] withPlayerType:JHLive];
    _playerView.frame = self.view.frame;
    [self.view addSubview:_playerView];
    
    
    
    
    
    
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"downIcon"] forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(10, 20, 30, 30);
    [self.view addSubview:backBtn];
    [backBtn addTarget:self action:@selector(closeController) forControlEvents:UIControlEventTouchUpInside];
    
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
-(BOOL)prefersStatusBarHidden{
    
    return true;
}

-(void)closeController
{
    [_playerView.ijkPlayer stop];
    [_playerView.ijkPlayer shutdown];
    [self dismissViewControllerAnimated:true completion:nil];

}
@end

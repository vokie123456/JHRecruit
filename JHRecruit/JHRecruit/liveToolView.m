//
//  liveToolView.m
//  JHRecruit
//
//  Created by milan on 2017/7/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "liveToolView.h"
#import "JHTool.h"
#import "mainLiveViewController.h"
@implementation liveToolView
-(instancetype)init
{
    self = [super init];
    if (self) {
        [self setLayout];
       
    }
    return self;
   
}


-(void)setLayout
{
    MyFrameLayout *rootView = [[MyFrameLayout alloc]init];
    rootView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [rootView setTarget:self action:@selector(hideMyView)];
    rootView.myMargin = 0;
    [self addSubview:rootView];
    self.rootView = rootView;
    
    _liveBtn = [self createButtonWithImgName:@"liveTool" withTitle:@"视频直播"];
    
    [rootView addSubview:_liveBtn];
    
    _voiceBtn = [self createButtonWithImgName:@"voiceTool" withTitle:@"语音直播"];
    [rootView addSubview:_voiceBtn];
    
    _articleBtn = [self createButtonWithImgName:@"articleTool" withTitle:@"发布动态"];
    [rootView addSubview:_articleBtn];
    
    _videoBtn = [self createButtonWithImgName:@"videoTool" withTitle:@"录制视频"];
    [rootView addSubview:_videoBtn];
    
    
    
    _liveBtn.tag = 0;
    _voiceBtn.tag = 1;
    _articleBtn.tag = 2;
    _videoBtn.tag = 3;
    
    [_liveBtn setTarget:self action:@selector(onClickTheBtn:)];
    [_voiceBtn setTarget:self action:@selector(onClickTheBtn:)];
    [_articleBtn setTarget:self action:@selector(onClickTheBtn:)];
    [_videoBtn setTarget:self action:@selector(onClickTheBtn:)];
    
}

-(MyLinearLayout*)createButtonWithImgName:(NSString *)imgName withTitle:(NSString*)title
{
    MyLinearLayout *btn = [[MyLinearLayout alloc]initWithOrientation:MyOrientation_Horz];
    btn.wrapContentSize = true;
    btn.myRight = 20;
    btn.myBottom = -100;
    
    
    
    UILabel *label = [UILabel new];
    label.text = title;
    label.font = [JHTool font:16];
    label.textColor = [UIColor whiteColor];
    label.myCenterY = 0;
    [label sizeToFit];
    [btn addSubview:label];
    
    UIImageView *img = [UIImageView new];
    img.image = [UIImage imageNamed:imgName];
    img.mySize = CGSizeMake(40, 40);
    img.myLeft = 10;
    [btn addSubview:img];
    
    
    return btn;
}



-(void)popView

{
   
    _liveBtn.myBottom = 60;
    _voiceBtn.myBottom = 120;
    _articleBtn.myBottom = 180;
    _videoBtn.myBottom = 240;
    
    
    
    _rootView.beginLayoutBlock = ^{
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
    };
    
    _rootView.endLayoutBlock = ^{
        
        [UIView commitAnimations];
    };

 
}
-(void)hideMyView{
    _liveBtn.myBottom = -100;
    _voiceBtn.myBottom = -100;
    _articleBtn.myBottom = -100;
    _videoBtn.myBottom = -100;
    
    
    __weak typeof(self) weakSelf = self;
    _rootView.beginLayoutBlock = ^{
        
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView setAnimationDelegate:weakSelf];
        [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
        
    };
    
    _rootView.endLayoutBlock = ^{
        
        [UIView commitAnimations];
    };

   
}

-(void)onClickTheBtn:(MyLinearLayout *)btn{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"floatBtnShow" object:nil];
   
    if (btn.tag == 0) {
        mainLiveViewController *mainLive = [[mainLiveViewController alloc]init];
        [self.window.rootViewController presentViewController:mainLive animated:true completion:nil];
        
    }
[self removeFromSuperview];    
}

-(void)didMoveToSuperview{
    
    [NSTimer scheduledTimerWithTimeInterval:0.30 target:self selector:@selector(popView) userInfo:nil repeats:nil];
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context{
 [self removeFromSuperview];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"floatBtnShow" object:nil];
}

@end

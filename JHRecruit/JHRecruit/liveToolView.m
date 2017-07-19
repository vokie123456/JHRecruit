//
//  liveToolView.m
//  JHRecruit
//
//  Created by milan on 2017/7/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "liveToolView.h"
#import "JHTool.h"
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
    _rootView = [[MyRelativeLayout alloc]init];
    _rootView.myMargin = 0;
    _rootView.backgroundColor = [JHTool color:0 widthGreen:0 widthBlue:0 alpha:0.3];
    [_rootView setTarget:self action:@selector(dismissTheView)];
    [self addSubview:_rootView];
    
    _liveBtn = [self createButtonWithImgName:@"liveTool" withTitle:@"视频直播"];
    _liveBtn.rightPos.equalTo(_rootView.rightPos).offset(10);
    _liveBtn.bottomPos.equalTo(_rootView.bottomPos).offset(-200);
    [_rootView addSubview:_liveBtn];
    
    _voiceBtn = [self createButtonWithImgName:@"voiceTool" withTitle:@"语音直播"];
    _voiceBtn.rightPos.equalTo(_liveBtn.rightPos);
    _voiceBtn.bottomPos.equalTo(_liveBtn.topPos).offset(10);
    [_rootView addSubview:_voiceBtn];
    
    _articleBtn = [self createButtonWithImgName:@"articleTool" withTitle:@"发布动态"];
    _articleBtn.bottomPos.equalTo(_voiceBtn.topPos).offset(10);
    _articleBtn.rightPos.equalTo(_liveBtn.rightPos);
    [_rootView addSubview:_articleBtn];
    
    _videoBtn = [self createButtonWithImgName:@"videoTool" withTitle:@"录制视频"];
    _videoBtn.bottomPos.equalTo(_articleBtn.topPos).offset(10);
    _videoBtn.rightPos.equalTo(_liveBtn.rightPos);
    [_rootView addSubview:_videoBtn];
    
    
    
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
-(void)dismissTheView
{
    _liveBtn.bottomPos.equalTo(_rootView.bottomPos).offset(-200);
    [_rootView layoutAnimationWithDuration:0.20];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.20*NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
        [self.delegate hideToolView];
//        [[NSNotificationCenter defaultCenter]postNotificationName:@"hideToolView" object:nil];
    });
   
    
   
}


-(void)popView
{
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1*NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        [_rootView layoutAnimationWithDuration:0.20];
        _liveBtn.bottomPos.equalTo(_rootView.bottomPos).offset(50);
    });
   

}

-(void)onClickTheBtn:(MyLinearLayout *)btn
{


        [self.delegate clickTheBtn:btn.tag];
    
}


@end

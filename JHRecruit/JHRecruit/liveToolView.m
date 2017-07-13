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
    _liveBtn.bottomPos.equalTo(_rootView.bottomPos);
    [_rootView addSubview:_liveBtn];
    
    _voiceBtn = [self createButtonWithImgName:@"voiceTool" withTitle:@"语音直播"];
    _voiceBtn.rightPos.equalTo(_liveBtn.rightPos);
    _voiceBtn.bottomPos.equalTo(_liveBtn.topPos).offset(10);
    [_rootView addSubview:_voiceBtn];
    
    
    
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
    _liveBtn.bottomPos.equalTo(_rootView.bottomPos).offset(-100);
    [_rootView layoutAnimationWithDuration:0.35];
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.32*NSEC_PER_SEC));
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
         self.hidden = true;
    });
   
    
   
}


-(void)setHidden:(BOOL)hidden
{
    [super setHidden:hidden];
    
    if (hidden) {
       

 

    }else{
        _liveBtn.bottomPos.equalTo(_rootView.bottomPos).offset(100);
        [_rootView layoutAnimationWithDuration:0.35];

    }
    
}

@end

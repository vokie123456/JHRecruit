//
//  JHPlayerView.m
//  JHRecruit
//
//  Created by milan on 2017/6/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "JHPlayerView.h"
#import "JHTool.h"



@implementation JHPlayerView



-(id)initWithUrl:(NSURL *)playUrl withPlayerType:(playerType)type
{
    self = [super init];
    if (self) {
        _ijkPlayer = [[IJKFFMoviePlayerController alloc]initWithContentURL:playUrl withOptions:nil];
        
        UIView *playView = [_ijkPlayer view];
        playView.frame = self.frame;
        playView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self addSubview:playView];
  
        if (type == JHVideo) {
            _ijkPlayer.shouldAutoplay = false;
            [self setLayout];
        }
    [_ijkPlayer prepareToPlay];

    }
    
    return self;
}


-(void)setLayout
{
    MyRelativeLayout *rootView = [[MyRelativeLayout alloc]init];
    rootView.myMargin = 0;
    rootView.backgroundColor = [UIColor clearColor];
    [rootView setTarget:self action:@selector(hideToolView)];

    [self addSubview:rootView];
    
    _toolView = [[MyRelativeLayout alloc]init];
    _toolView.myHorzMargin = 0;
    _toolView.backgroundColor = [JHTool color:0 widthGreen:0 widthBlue:0 alpha:0.6];
    _toolView.wrapContentHeight = true;
    _toolView.bottomPos.equalTo(self.bottomPos);
    [rootView addSubview:_toolView];
    
    _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_playBtn setBackgroundImage:[UIImage imageNamed:@"playIcon"] forState:UIControlStateNormal];
    [_playBtn setBackgroundImage:[UIImage imageNamed:@"pauseIcon"] forState:UIControlStateSelected];
    [_playBtn addTarget:self action:@selector(startPlay:) forControlEvents:UIControlEventTouchUpInside];
    _playBtn.myHeight = 25;
    _playBtn.myWidth = 25;
    _playBtn.leftPos.equalTo(_toolView.leftPos).offset(10);
    _playBtn.topPos.equalTo(_toolView.topPos).offset(10);
    [_toolView addSubview:_playBtn];
    
    
    
    _currentLabel = [UILabel new];
    _currentLabel.text = @"0:00";
    _currentLabel.font = [JHTool font:12];
    _currentLabel.myLeft = 10;
    _currentLabel.textColor = [UIColor whiteColor];
    _currentLabel.topPos.equalTo(_playBtn.bottomPos).offset(10);
    [_currentLabel sizeToFit];
    [_toolView addSubview:_currentLabel];
    
    _durationLabel = [UILabel new];
    _durationLabel.text = @"0:00";
    _durationLabel.textColor = [UIColor whiteColor];
    _durationLabel.font = [JHTool font:12];
    [_durationLabel sizeToFit];
    _durationLabel.rightPos.equalTo(_toolView.rightPos).offset(10);
    _durationLabel.topPos.equalTo(_currentLabel.topPos);

    [_toolView addSubview:_durationLabel];
    
    _slider = [UISlider new];
    _slider.minimumValue = 0;
    _slider.maximumValue = 1;
    _slider.leftPos.equalTo(_currentLabel.rightPos).offset(10);
    _slider.rightPos.equalTo(_durationLabel.leftPos).offset(10);
    _slider.topPos.equalTo(_playBtn.bottomPos);
    [_slider setThumbImage:[UIImage imageNamed:@"thumbImg"] forState:UIControlStateNormal];
    _slider.tintColor = [JHTool thisAppTintColor];
    
    
    [_slider addTarget:self action:@selector(touchDownSlider:) forControlEvents:UIControlEventTouchDown];
    [_slider addTarget:self action:@selector(valueChangeSlider:) forControlEvents:UIControlEventValueChanged];
    [_slider addTarget:self action:@selector(touchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [_toolView addSubview:_slider];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerAction:) userInfo:nil repeats:false];
    [[NSRunLoop mainRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
    _toolHide = false;
    
}

-(void)startPlay:(UIButton *)btn
{   [self removeToolTimer];
    [self addToolTimer];
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        [_ijkPlayer play];
        [self addProgressTimer];
    }else{
        [_ijkPlayer pause];
        [self removeProgressTimer];
    }
}


-(void)hideToolView
{
    _toolHide = !_toolHide;
    if (_toolHide) {
        [UIView animateWithDuration:0.5 animations:^{
            _toolView.alpha = 0;
        }];
        [self removeToolTimer];
        
    }else{
        
        [self addToolTimer];
        [UIView animateWithDuration:0.5 animations:^{
            _toolView.alpha = 1;
        }];
    }
   
}

-(void)timerAction:(NSTimer *)timer
{
        [UIView animateWithDuration:0.5 animations:^{
            _toolView.alpha = 0;
        }];
    
    [timer invalidate];
    timer = nil;

    
}


#pragma mark - 进度条的代理方法
-(void)touchDownSlider:(UISlider *)slider
{
    [self removeProgressTimer];
    [self removeToolTimer];
}

-(void)valueChangeSlider:(UISlider*)slider
{
    _currentLabel.text = [self timeToStringWithTimeInterval:_ijkPlayer.currentPlaybackTime];
}

-(void)touchUpInside:(UISlider*)slider
{
    [self addProgressTimer];
    NSTimeInterval currentTime = _ijkPlayer.duration*slider.value;
    [_ijkPlayer setCurrentPlaybackTime:currentTime];
    [self addToolTimer];
}


#pragma mark - 定时器
//添加工具栏隐藏定时器
-(void)addToolTimer
{
    _toolTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(timerAction:) userInfo:nil repeats:false];
    [[NSRunLoop mainRunLoop]addTimer:_toolTimer forMode:NSRunLoopCommonModes];
}

//移除工具隐藏定时器
-(void)removeToolTimer
{
    [_toolTimer invalidate];
    _toolTimer = nil;
}

//添加进度定时器
-(void)addProgressTimer
{
    _progressTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateProgressInfo) userInfo:nil repeats:true];
    [[NSRunLoop mainRunLoop]addTimer:_progressTimer forMode:NSRunLoopCommonModes];
}
//移除进度定时器
-(void)removeProgressTimer
{
    [_progressTimer invalidate];
    _progressTimer = nil;
}

//更新进度信息
-(void)updateProgressInfo
{
    
    if (!_ijkPlayer.isPlaying) {
        [self removeProgressTimer];
    }
    _slider.value = _ijkPlayer.currentPlaybackTime/_ijkPlayer.duration;
    _currentLabel.text = [self timeToStringWithTimeInterval:_ijkPlayer.currentPlaybackTime];
    _durationLabel.text = [self timeToStringWithTimeInterval:_ijkPlayer.duration];
}


-(NSString*)timeToStringWithTimeInterval:(NSTimeInterval)interval
{
    NSInteger min = interval/60;
    NSInteger ss = (NSInteger)interval%60;
    NSString *timeString = [NSString stringWithFormat:@"%ld:%ld",(long)min,(long)ss];
    return timeString;
}

@end

//
//  mainLiveViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/21.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "mainLiveViewController.h"
#import <LFLiveKit/LFLiveKit.h>
@interface mainLiveViewController ()<LFLiveSessionDelegate>
@property(nonatomic,strong)LFLiveSession *session;

@end

@implementation mainLiveViewController

-(LFLiveSession *)session
{
    if (_session == nil) {
          _session = [[LFLiveSession alloc]initWithAudioConfiguration:[LFLiveAudioConfiguration defaultConfiguration] videoConfiguration:[LFLiveVideoConfiguration defaultConfiguration]];
    }
    
    return _session;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    
    self.session.delegate = self;
    self.session.preView = self.view;

    //请求音视频权限
    [self requestAuthorization];
   
    LFLiveStreamInfo *info = [LFLiveStreamInfo new];
    info.url = @"rtmp://120.24.238.2:1935/rtmplive/room";
    [self.session startLive:info];
    
    
    
}


-(void)requestAuthorization
{
    AVAuthorizationStatus audioState = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    AVAuthorizationStatus videoState = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    if (audioState == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:nil];
    }
    
    if (videoState == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:nil];
    }
    
    if (audioState == AVAuthorizationStatusAuthorized || videoState == AVAuthorizationStatusAuthorized) {
        [self.session setRunning:true];
        
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"应用需要媒体设备权限" message:nil preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:nil];
            
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:nil];
            
        }];
        
        [alertController addAction:action];
        [self presentViewController:alertController animated:true completion:nil];
        
    }
}

#pragma mark -- 推流框架代理方法

-(void)liveSession:(LFLiveSession *)session liveStateDidChange:(LFLiveState)state
{
    switch (state) {
        case LFLiveStart:
            NSLog(@"连接成功，开始直播");
            break;
        case LFLiveError:
            NSLog(@"连接出错");
        
        default:
            break;
    }
    NSLog(@"dfdsfdsfdsf");
}

-(void)liveSession:(LFLiveSession *)session errorCode:(LFLiveSocketErrorCode)errorCode
{
    switch (errorCode) {
        case LFLiveSocketError_PreView:
            NSLog(@"预览失败");
            break;
            
        default:
            break;
    }
}

-(void)liveSession:(LFLiveSession *)session debugInfo:(LFLiveDebug *)debugInfo
{
    NSLog(@"%f",debugInfo.timeStamp);
}

@end

//
//  mainLiveViewController.m
//  JHRecruit
//
//  Created by milan on 2017/7/21.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "mainLiveViewController.h"
#import <LFLiveKit/LFLiveKit.h>
#import "liveInfoViewController.h"
#import "barrageViewController.h"

@interface mainLiveViewController ()<LFLiveSessionDelegate,liveConfigDelegate>
@property(nonatomic,strong)LFLiveSession *session;
@property(nonatomic,strong)liveInfoViewController *infoController;
@property(nonatomic,strong)barrageViewController *barrageController;

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
   
   
    
    liveInfoViewController *infoController = [[liveInfoViewController alloc]init];
    infoController.delegate = self;
    [self addChildViewController:infoController];
    [self.view addSubview:infoController.view];
     self.infoController = infoController;
    
    [self setBeautyView];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.111:3000"];
    self.socketClient = [[SocketIOClient alloc]initWithSocketURL:url config:@{@"log":@true, @"compress":@true}];
     [self.socketClient connect];
    
    
    
}
-(void)setBeautyView{
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction)];
    [self.view addGestureRecognizer:tapGesture];
    
    MyFloatLayout *beautyView = [[MyFloatLayout alloc]initWithOrientation:MyOrientation_Vert];
    beautyView.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    beautyView.useFrame = true;
    beautyView.frame = CGRectMake(0, VIEW_HEIGHT, VIEW_WIDTH, 200);
    beautyView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [self.view addSubview:beautyView];
    self.beautyView = beautyView;
    
    UILabel *switchLabel = [UILabel new];
    switchLabel.text = @"开启美颜";
    switchLabel.font = [JHTool font:16];
    switchLabel.textColor = [UIColor whiteColor];
    [switchLabel sizeToFit];
    switchLabel.myTop = 5;
    [beautyView addSubview:switchLabel];
    
    UISwitch *beautySwitch = [[UISwitch alloc]init];
    beautySwitch.on = true;
    beautySwitch.onTintColor = [JHTool thisAppTintColor];
    beautySwitch.myLeft = 10;
    [beautyView addSubview:beautySwitch];
    
    UIButton *resetBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [resetBtn setTitle:@"重置" forState:UIControlStateNormal];
    resetBtn.titleLabel.font = [JHTool font:16];
    resetBtn.mySize = CGSizeMake(60, 30);
    resetBtn.layer.cornerRadius = 5;
    resetBtn.layer.borderColor = [JHTool thisAppTintColor].CGColor;
    resetBtn.layer.borderWidth = 1;
    resetBtn.reverseFloat = true;
    [beautyView addSubview:resetBtn];
    
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

-(void)tapGestureAction{
    
    [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.beautyView.frame = CGRectMake(0, VIEW_HEIGHT, VIEW_WIDTH, 200);
    } completion:^(BOOL finished) {
        self.infoController.view.hidden = false;
        self.barrageController.view.hidden = false;
    }];
    
   
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

#pragma mark - liveConfigDelegate代理方法
-(void)startLive{
    
    LFLiveStreamInfo *info = [LFLiveStreamInfo new];
    info.url = @"rtmp://120.24.238.2:1935/rtmplive/room";
    [self.session startLive:info];
    
    self.infoController.delegate = nil;
    [self.infoController removeFromParentViewController];
    [self.infoController.view removeFromSuperview];
    
    barrageViewController *barrageController = [[barrageViewController alloc]init];
    barrageController.delegate = self;
    barrageController.socketClient = self.socketClient;
    barrageController.view.frame = self.view.frame;
    [self addChildViewController:barrageController];
    [self.view addSubview:barrageController.view];
    self.barrageController = barrageController;
    [self.view bringSubviewToFront:self.beautyView];
   
    [self.socketClient emit:@"create_room" with:@[@{@"title":@"糜烂的东西",@"key":@"1234"}]];
    
   
}
-(void)showBeautyView{
    self.infoController.view.hidden = true;
    self.barrageController.view.hidden = true;
     [UIView animateWithDuration:0.2 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
       self.beautyView.frame = CGRectMake(0, VIEW_HEIGHT-200, VIEW_WIDTH, 200);
    } completion:nil];
    

}

-(void)closeControllerAndStopLive{
    [self.socketClient disconnect];
    [_session stopLive];
    [_session setRunning:false];
    
    [self dismissViewControllerAnimated:true completion:nil];
}

-(void)changeCameraDirection{
    
    if (_session.captureDevicePosition == AVCaptureDevicePositionFront) {
        _session.captureDevicePosition = AVCaptureDevicePositionBack;
    }else{
        
        _session.captureDevicePosition = AVCaptureDevicePositionFront;
    }
    
   
}

@end

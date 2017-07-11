//
//  JHPlayerView.h
//  JHRecruit
//
//  Created by milan on 2017/6/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "MyLayout.h"
typedef enum _playerType{
    video = 0,
    live
}playerType;

@interface JHPlayerView : UIView
{
    MyRelativeLayout *_rootView;
    MyRelativeLayout *_toolView;
    UIButton *_playBtn;
    
    UISlider *_slider;
    UILabel *_currentLabel;
    UILabel *_durationLabel;
    
    NSTimer *_toolTimer;
    
    BOOL _toolHide;
    
    NSTimer *_progressTimer;
    
}

@property(nonatomic,strong)id<IJKMediaPlayback> ijkPlayer;

-(id)initWithUrl:(NSURL*)playUrl withPlayerType:(playerType)type;

@end

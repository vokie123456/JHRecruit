//
//  liveConfigDelegate.h
//  JHRecruit
//
//  Created by milan on 2017/8/1.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol liveConfigDelegate <NSObject>
@optional
-(void)startLive;
-(void)closeControllerAndStopLive;
-(void)showBeautyView;
-(void)changeCameraDirection;
@end

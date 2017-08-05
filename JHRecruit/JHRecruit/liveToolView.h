//
//  liveToolView.h
//  JHRecruit
//
//  Created by milan on 2017/7/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLayout.h"

@interface liveToolView : UIView
@property (nonatomic , strong) MyFrameLayout *rootView;
@property(nonatomic,strong)MyLinearLayout *liveBtn;
@property(nonatomic,strong)MyLinearLayout *voiceBtn;
@property(nonatomic,strong)MyLinearLayout *videoBtn;
@property(nonatomic,strong)MyLinearLayout *articleBtn;


-(void)popView;


@end

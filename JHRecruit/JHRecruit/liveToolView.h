//
//  liveToolView.h
//  JHRecruit
//
//  Created by milan on 2017/7/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLayout.h"


@protocol ToolViewDelegate <NSObject>

-(void)clickTheBtn:(NSInteger)btnInteger;
-(void)hideToolView;

@end

@interface liveToolView : UIView
@property(nonatomic,strong)MyLinearLayout *liveBtn;
@property(nonatomic,strong)MyLinearLayout *voiceBtn;
@property(nonatomic,strong)MyLinearLayout *videoBtn;
@property(nonatomic,strong)MyLinearLayout *articleBtn;
@property(nonatomic,strong)MyRelativeLayout *rootView;
@property(nonatomic,strong)MyLinearLayout *contentView;
@property(nonatomic,strong)id<ToolViewDelegate> delegate;
-(void)popView;
-(void)dismissTheView;

@end

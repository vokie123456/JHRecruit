//
//  recruitViewController.h
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "persionalViewController.h"


@interface recruitViewController : UIViewController
{
    UIScrollView *_scroll;
    persionalViewController *_persional;

    UIView *_segView;
}
@property(nonatomic,strong) UISegmentedControl *segment;


@end
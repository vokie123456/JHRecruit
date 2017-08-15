//
//  liveInfoViewController.h
//  JHRecruit
//
//  Created by milan on 2017/7/21.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "liveConfigDelegate.h"
@interface liveInfoViewController : UIViewController
@property (nonatomic , weak) id<liveConfigDelegate> delegate;

@end

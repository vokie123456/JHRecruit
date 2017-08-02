//
//  barrageTableViewCell.h
//  JHRecruit
//
//  Created by milan on 2017/8/2.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "barrageModel.h"
@interface barrageTableViewCell : UITableViewCell
@property (nonatomic , strong) MyBaseLayout *rootView;
@property (nonatomic , strong) UILabel *contentLabel;
@property (nonatomic , strong) barrageModel *model;
@end

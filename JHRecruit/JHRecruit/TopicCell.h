//
//  TopicCell.h
//  JHRecruit
//
//  Created by milan on 2017/11/6.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
@interface TopicCell : UITableViewCell
@property(nonatomic,strong)MyBaseLayout *rootLayout;
@property(nonatomic,strong)TopicModel *model;
@end

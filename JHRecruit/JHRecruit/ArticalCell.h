//
//  ArticalCell.h
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticalModel.h"

@interface ArticalCell : UITableViewCell
@property (nonatomic , strong) MyBaseLayout *rootLayout;
@property (nonatomic , strong) ArticalModel *model;

@end

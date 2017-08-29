//
//  workPositionCell.h
//  JHRecruit
//
//  Created by milan on 2017/8/29.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "positionModel.h"
@interface workPositionCell : UITableViewCell
{
    UILabel *_positionName;
    UILabel *_companyName;
    UILabel *_education;
    UILabel *_experience;
    UILabel *_location;
    UILabel *_wage;
}
@property (nonatomic , strong) positionModel *model;
@property (nonatomic , strong) MyBaseLayout *rootView;
@end

//
//  companyTableViewCell.h
//  JHRecruit
//
//  Created by milan on 2017/6/24.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "companyModel.h"
#import "MyLayout.h"

@interface companyTableViewCell : UITableViewCell
{
    UIImageView *_headerView;
    UILabel *_companyName;
    UILabel *_address;
    UILabel *_type;
    UILabel *_scale;
}

@property(nonatomic,strong,readonly) MyBaseLayout *rootView;
@property(nonatomic,strong) companyModel *model;
@end

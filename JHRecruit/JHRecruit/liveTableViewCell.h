//
//  liveTableViewCell.h
//  JHRecruit
//
//  Created by milan on 2017/7/9.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveModel.h"
#import "MyLayout.h"
@interface liveTableViewCell : UITableViewCell
{
    UIImageView *_headerImg;
    UILabel *_nickName;
    UILabel *_city;
    UILabel *_number;
    
}
@property(nonatomic,strong)LiveModel *model;
@property(nonatomic,strong)MyBaseLayout *rootView;
@end

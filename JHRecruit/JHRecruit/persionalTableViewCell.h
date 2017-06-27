//
//  persionalTableViewCell.h
//  JHRecruit
//
//  Created by milan on 2017/6/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLayout.h"
#import "recruitDataModel.h"
/**
    动态高度UITableViewCell
 */
@interface persionalTableViewCell : UITableViewCell
//对于需要动态评估高度的UITableViewCell来说可以吧布局视图暴露出来。用于高度评估和边界线处理。以及事件设置
{
    UIImageView *_headerImg;
    UILabel *_nickName;
    UILabel *_education;
    UILabel *_target;
    UILabel *_experience;
    UILabel *_wage;
}

@property(nonatomic,strong,readonly)MyBaseLayout *rootLayout;
@property(nonatomic,strong) persionalDataModel *model;


@end

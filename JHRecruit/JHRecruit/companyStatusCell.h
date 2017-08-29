//
//  companyStatusCell.h
//  JHRecruit
//
//  Created by milan on 2017/8/27.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface companyStatusCell : UITableViewCell
@property (nonatomic , strong) NSString *contentStr;
@property (nonatomic , strong) UILabel *contentLabel;
@property (nonatomic , strong) UIImageView *iconImgView;
@property (nonatomic , strong) MyBaseLayout *rootView;
@property (nonatomic , strong) MyLinearLayout *contentLayout;
@property(nonatomic,assign) BOOL isShowLabel;

@end

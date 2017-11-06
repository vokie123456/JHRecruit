//
//  CommentCell.h
//  JHRecruit
//
//  Created by milan on 2017/11/3.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

typedef void(^agreeBlock)(void);

@interface CommentCell : UITableViewCell
@property (nonatomic , strong) MyBaseLayout *rootLayout;
@property (nonatomic , strong) CommentModel *model;
@property(nonatomic , copy)agreeBlock agreeBtnBlock;

@end

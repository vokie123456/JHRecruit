//
//  recruitDataModel.h
//  JHRecruit
//
//  Created by milan on 2017/6/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface persionalDataModel : NSObject
@property(nonatomic,strong) NSString *headerImg;//头像
@property(nonatomic,strong) NSString *nickName;//昵称
@property(nonatomic,strong) NSString *education;//学历
@property(nonatomic,strong) NSString *target;//求职意向
@property(nonatomic,strong) NSString *experience;//经验
@property(nonatomic,strong) NSString *wage;//工资

@end

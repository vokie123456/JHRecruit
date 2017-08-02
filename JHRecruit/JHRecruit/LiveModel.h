//
//  LiveModel.h
//  JHRecruit
//
//  Created by milan on 2017/7/8.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@class liveCreater;
@interface LiveModel : NSObject
@property(nonatomic,strong)liveCreater *creator;
@property(nonatomic,copy)NSString *stream_addr;
@property(nonatomic,assign) NSUInteger online_users;
@property(nonatomic,copy)NSString *city;
@end

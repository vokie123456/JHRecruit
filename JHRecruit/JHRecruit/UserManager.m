//
//  UserManager.m
//  JHRecruit
//
//  Created by milan on 2017/8/15.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "UserManager.h"

@implementation UserManager
static id manager = nil;
+(instancetype)shareManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[UserManager alloc]init];
        }
    });
    
    return manager;
    
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [super allocWithZone:zone];
    });
    return manager;
}

-(id)copy{
    return manager;
}



@end

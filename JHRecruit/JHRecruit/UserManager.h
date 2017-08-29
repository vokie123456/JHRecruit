//
//  UserManager.h
//  JHRecruit
//
//  Created by milan on 2017/8/15.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject

@property(nonatomic,copy) NSString *loginName;
@property(nonatomic,copy) NSString *loginPsw;

@property(nonatomic,copy) NSString *registName;
@property(nonatomic,copy) NSString *registPsw;


+(instancetype)shareManager;
-(void)postRegistInfo;
-(void)postLoginInfo;
-(void)saveUserInfo;
-(BOOL)autoLogin;
@end

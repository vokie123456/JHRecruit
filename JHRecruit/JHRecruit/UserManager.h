//
//  UserManager.h
//  JHRecruit
//
//  Created by milan on 2017/8/15.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^successBlock)(void);
typedef void(^failBlock)(void);

@interface UserManager : NSObject

+(instancetype)shareManager;

-(void)postRegistInfoWithUid:(NSString*)uid password:(NSString*)pwd success:(successBlock)success fail:(failBlock)fail;

-(void)postLoginInfoWithUid:(NSString*)uid password:(NSString*)pwd success:(successBlock)success fail:(failBlock)fail;

-(void)updateUserResumeWithDic:(NSDictionary*)dic success:(successBlock)successBlock fail:(failBlock)failBlock;

-(void)saveUserInfoWithUserNme:(NSString*)uid;
-(BOOL)isLogined;
@end

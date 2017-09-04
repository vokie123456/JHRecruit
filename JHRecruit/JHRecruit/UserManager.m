//
//  UserManager.m
//  JHRecruit
//
//  Created by milan on 2017/8/15.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "UserManager.h"
#import "AFNetworking.h"

@interface UserManager()
@property(nonatomic,copy) NSString *loginName;
@property(nonatomic,copy) NSString *loginPsw;
@property(nonatomic,copy) NSString *registName;
@property(nonatomic,copy) NSString *registPsw;
@property(nonatomic,copy) successBlock successBlock;
@property(nonatomic,copy) failBlock failBlock;
@property(nonatomic,strong) AFHTTPSessionManager *AFManager;
@property(nonatomic,strong) NSUserDefaults *userDefault;

@end

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


-(AFHTTPSessionManager*)AFManager{
    if (!_AFManager) {
        _AFManager = [AFHTTPSessionManager manager];
        _AFManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _AFManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _AFManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
        
    }
    return _AFManager;
}

-(NSUserDefaults*)userDefault{
    if (!_userDefault) {
        _userDefault = [NSUserDefaults standardUserDefaults];
    }
    return _userDefault;
}

-(void)postLoginInfoWithUid:(NSString *)uid password:(NSString *)pwd success:(successBlock)success fail:(failBlock)fail{
    
    self.successBlock = success;
    self.failBlock = fail;
    
    
    [self.AFManager POST:@"http://www.jh520.top/login.php" parameters:@{@"userName":uid,@"passWord":pwd} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dic = responseObject;
        if ([dic[@"code"] intValue] == 1) {
            !self.successBlock?:self.successBlock();//三目运算符
            [self.userDefault setObject:uid forKey:@"userName"];
            [self.userDefault setBool:true forKey:@"isLogin"];
            
        }else{
            !_failBlock?:_failBlock();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
    
}

-(void)postRegistInfoWithUid:(NSString *)uid password:(NSString *)pwd success:(successBlock)success fail:(failBlock)fail{
    self.successBlock = success;
    self.failBlock = fail;
    
    [self.AFManager POST:@"http://www.jh520.top/regist.php" parameters:@{@"userName":uid,@"passWord":pwd} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dic = responseObject;
        if ([dic[@"code"] intValue] == 1) {
            !_successBlock?:_successBlock();
            [self.userDefault setObject:uid forKey:@"userName"];
            [self.userDefault setBool:true forKey:@"isLogin"];
            
        }else{
            !_failBlock?:_failBlock();

        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
           }];
    

}

-(void)updateUserResumeWithDic:(NSDictionary *)dic success:(successBlock)successBlock fail:(failBlock)failBlock{
    _successBlock = successBlock;
    _failBlock = failBlock;

    [self.AFManager POST:@"http://www.jh520.top/resumeUpdate.php" parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dic = responseObject;
        if ([dic[@"code"] intValue] == 1) {
            !_successBlock?:_successBlock();
            
        }else{
            !_failBlock?:_failBlock();
            
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
    }];
}


@end

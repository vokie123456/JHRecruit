//
//  ArticalModel.h
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticalModel : NSObject
@property (nonatomic , strong) NSString *headerImg;
@property (nonatomic , strong) NSString *nickName;
@property (nonatomic , strong) NSString *titleStr;
@property (nonatomic , strong) NSString *contentStr;
@property (nonatomic , strong) NSString *contentImg;
@property (nonatomic , strong) NSString *agreeNum;
@property (nonatomic , strong) NSString *commentNum;

+(NSMutableArray*)getDataArray;


@end

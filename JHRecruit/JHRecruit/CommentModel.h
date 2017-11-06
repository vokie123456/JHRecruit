//
//  CommentModel.h
//  JHRecruit
//
//  Created by milan on 2017/11/3.
//  Copyright © 2017年 milan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopicModel.h"

@interface CommentModel : NSObject
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *headerIcon;
@property(nonatomic,copy)NSString *commentContent;
@property(nonatomic,copy)NSString *agreeNum;
@property(nonatomic,strong)NSMutableArray *topicArray;

+(NSMutableArray*)getDataArray;

@end

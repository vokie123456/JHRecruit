//
//  CommentModel.m
//  JHRecruit
//
//  Created by milan on 2017/11/3.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "CommentModel.h"

@implementation CommentModel
+(NSMutableArray *)getDataArray{
    NSMutableArray *dataArray = [NSMutableArray array];
    
    NSArray *headerArray = @[@"headerIcon1",@"headerIcon2",@"headerIcon3",@"headerIcon4"];
    NSArray *nameArray = @[@"为情所困",@"再回首恍然如梦",@"想你夜不能寐",@"左手倒影"];
    NSArray *contentArray = @[@"人生若只如初见，何事秋风悲画扇。",@"我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。",@"世界上一成不变的东西，只有“任何事物都是在不断变化的”这条真理。",@"真正的科学家应当是个幻想家；谁不是幻想家，谁就只能把自己称为实践家。"];
    NSArray *agreeNumArray = @[@"677",@"79",@"168",@"996"];
    NSArray *TopicNameArray = @[@"为情所困",@"再回首恍然如梦",@"想你夜不能寐",@"左手倒影",@""];
    for (int i=0; i<20; i++) {
        CommentModel *model = [CommentModel new];
        model.userName = nameArray[arc4random_uniform((uint32_t)nameArray.count)];
        model.headerIcon = headerArray[arc4random_uniform((uint32_t)headerArray.count)];
        model.commentContent = contentArray[arc4random_uniform((uint32_t)contentArray.count)];
        model.agreeNum = agreeNumArray[arc4random_uniform((uint32_t)agreeNumArray.count)];
        model.topicArray = [NSMutableArray array];
        for (int k = 0; k<5; k++) {
            TopicModel *topicModel = [TopicModel new];
            topicModel.userName = nameArray[arc4random_uniform((uint32_t)nameArray.count)];
            topicModel.toUser = TopicNameArray[arc4random_uniform((uint32_t)TopicNameArray.count)];
            topicModel.headerIcon = headerArray[arc4random_uniform((uint32_t)headerArray.count)];
            topicModel.replayContent = contentArray[arc4random_uniform((uint32_t)contentArray.count)];
            [model.topicArray addObject:topicModel];
        }
        
        
    
     
        
        
        [dataArray addObject:model];
    }
    
    return dataArray;
}
@end

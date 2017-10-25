//
//  ArticalModel.m
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "ArticalModel.h"

@implementation ArticalModel

+(NSMutableArray *)getDataArray{
    NSMutableArray *datas = [NSMutableArray array];
    
    NSArray *headerArray = @[@"headerIcon1",@"headerIcon2",@"headerIcon3",@"headerIcon4"];
    NSArray *nameArray = @[@"为情所困",@"再回首恍然如梦",@"想你夜不能寐",@"左手倒影",];
    NSArray *imgArray = @[@"articalimg1",@"articalimg2",@"articalimg3",@"articalimg4",@""];
    NSArray *titleArray = @[@"人生若只如初见，何事秋风悲画扇。",@"我需要三件东西：爱情友谊和图书。然而这三者之间何其相通！炽热的爱情可以充实图书的内容，图书又是人们最忠实的朋友。",@"世界上一成不变的东西，只有“任何事物都是在不断变化的”这条真理。",@"真正的科学家应当是个幻想家；谁不是幻想家，谁就只能把自己称为实践家。"];
    NSArray *contentArray = @[@"这两天随着十九大的胜利召开，一些振奋人心的新名词被大家热议着。未来的中国将要建设成为科技强国、质量强国、航天强国、网络强国、交通强国、数字中国，而广大科技人员也奋力走在实现这些宏伟目标的路上。",@"今天的节目我们要关注一种叫做铼的金属。这种金属很稀缺，每年全世界的产量仅仅只有40多吨，它非常昂贵，价格与白金的价格相仿。它之所以价值连城，还因为它在航空和国防制造业中能发挥非常重要作用。",@"中国科学院工程热物理所轻型动力实验室实任（新浪注：应为“主任”）徐纲：这一款涡扇发动机它的耗油率、寿命指标都达到了国际先进水平，国内也是个空白，所有的零件都是自主设计、自主生产，尤其是像里面的高温的单晶涡轮叶片，实际上就是可以说发动机里面加工的难点中的难点。",@"在成都航宇超合金技术有限公司，我们见到了单晶叶片生产中最为关键的金属—铼。这是人类发现最晚的天然元素，因为发现者是德国化学家，因此以莱茵河的名称命名为铼。它在地壳中的含量比所有的稀土元素都小，比钻石更难以获取。根据美国地质调查局的报告，全球探明的铼储量仅为2500吨左右。铼的价格跟白金的价格相仿，一克大概需要两三百块钱。"];
    NSArray *numArray = @[@"1920",@"1080",@"720",@"943"];
    
    for (int i = 0; i<10; i++) {
        ArticalModel *model = [ArticalModel new];
        model.agreeNum = numArray[arc4random_uniform((uint32_t)numArray.count)];
        model.commentNum = numArray[arc4random_uniform((uint32_t)numArray.count)];
        model.titleStr = titleArray[arc4random_uniform((uint32_t)titleArray.count)];
        model.contentStr = contentArray[arc4random_uniform((uint32_t)contentArray.count)];
        model.nickName = nameArray[arc4random_uniform((uint32_t)nameArray.count)];
        model.headerImg = headerArray[arc4random_uniform((uint32_t)headerArray.count)];
        model.contentImg = imgArray[arc4random_uniform((uint32_t)imgArray.count)];
        
        [datas addObject:model];
        
    }
    
    
    return datas;
}

@end

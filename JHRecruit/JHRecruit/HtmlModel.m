//
//  HtmlModel.m
//  JHRecruit
//
//  Created by milan on 2017/10/26.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "HtmlModel.h"

@implementation HtmlModel
+(NSString*)getHtmlString{
    NSString *htmlStr = [NSString string];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    NSString *titleStr = @"你必须要掌握的十大面试技巧";
    
    NSString *p1 = @"面试技巧指的是在面试时候的技巧。面试是你能够得到一份工作的关键。内容包括面试前的准备工作、面试当中应该注意的问题，以及如何在面试中推销自己等等。";
    NSString *p2 = @"面试是一个短时交流的过程，这个过程中包涵首因效应的管理，晕轮效应的管理，如何做好面试管理对求职者至关重要。";
    
    NSString *img1 = [NSString stringWithFormat:@"<img src='%@' height='200' width='%f'/>",@"http://mpic.tiankong.com/624/617/624617e1649fbcddd8f751b204464c92/640.jpg",width-20];
    
    NSString *p3 = @"你在面试时一定要注意把紧自己的嘴巴，如果认为已经回答完了，就不要再讲。最好不要为了自我推销而试图采用多讲话的策略来谋求在较短的时间内让招聘方多了解自己，事实上这种方式对大多数人来讲并不可取。该讲的讲，不该讲的决不要多讲，更不要采取主动出击的办法，以免画蛇添足、无事生非。";
    NSString *img2 = [NSString stringWithFormat:@"<img src='%@' height='200' width='%f' />",@"http://www.jianlimoban.net/upload/2016-04/160426150472042.jpg",width-20];
    
    NSString *p4 = @"面试是一个短时交流的过程，这个过程中包涵首因效应的管理，晕轮效应的管理，如何做好面试管理对求职者至关重要。以下是面试过程中最忌讳的一些表现。";
    NSString *p5 = @"面试中对自己经历及能力的表述应简明扼要，适可而止，千万不要像打开话匣子般没完没了地夸夸其谈，自吹自擂，甚至主次不分地“反客为主”。求职者要讲究实在，言简意赅，不可大包大揽地做太多的口头承诺，说得太多了容易引起考官的反感。有夸海口之嫌的话在求职面试场合，一定要慎言。";
    
    htmlStr = [NSString stringWithFormat:@"<body> <h2>%@</h2> <p>%@</p> <p>%@</p>  %@<br/> <p>%@</p> %@<br/> <p>%@</p> <p>%@</p> <br/><br/> <p align='right' style='color:LightGrey;'>编辑于  2017.06.12</p><br/><br/><br/><br/> </body>",titleStr,p1,p2,img1,p3,img2,p4,p5];
    
    return htmlStr;
}

@end

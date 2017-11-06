//
//  TopicViewController.m
//  JHRecruit
//
//  Created by milan on 2017/11/6.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicCell.h"

@interface TopicViewController()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation TopicViewController

-(void)viewDidLoad{
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[TopicCell class] forCellReuseIdentifier:NSStringFromClass([TopicCell class])];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TopicCell class]) forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
    
}

@end

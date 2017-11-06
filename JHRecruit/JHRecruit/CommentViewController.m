//
//  CommentViewController.m
//  JHRecruit
//
//  Created by milan on 2017/11/2.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "CommentViewController.h"
#import "CommentCell.h"
#import "CommentModel.h"
#import "TopicViewController.h"

@interface CommentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,copy)NSMutableArray *dataArray;

@end

@implementation CommentViewController
-(UITableView *)tableview{
    if (_tableview == nil) {
        _tableview = [UITableView new];
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.view = _tableview;
    }
    
    return _tableview;
    
}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [CommentModel getDataArray];
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"评论";
    
    self.tableview.estimatedRowHeight = 40;
    self.tableview.rowHeight = UITableViewAutomaticDimension;
    self.tableview.estimatedSectionFooterHeight = 0;
    self.tableview.estimatedSectionHeaderHeight = 0;
    
    [self.tableview registerClass:[CommentCell class] forCellReuseIdentifier:NSStringFromClass([CommentCell class])];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CommentCell class]) forIndexPath:indexPath];
    
    CommentModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    [cell setHighlighted:false];
    
    cell.agreeBtnBlock = ^{
        NSString *str = model.agreeNum;
        int num = [str intValue] + 1;
        model.agreeNum = [NSString stringWithFormat:@"%d",num];
        
             [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
       
        
        
        
       
    };
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentModel *model = self.dataArray[indexPath.row];
    TopicViewController *topic = [TopicViewController new];
    topic.dataArray = model.topicArray;

    [self.navigationController pushViewController:topic animated:true];
    
    
}
@end

//
//  ArticleViewController.m
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "ArticleViewController.h"
#import "ArticalCell.h"
#import "DetailsArticalController.h"


@interface ArticleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;


@end


@implementation ArticleViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"社区";
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
   
    self.tableView.estimatedRowHeight = 40;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [JHTool thisAppBackgroundColor];
    self.tableView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
    self.view = _tableView;
    [self.tableView registerClass:[ArticalCell class] forCellReuseIdentifier:NSStringFromClass([ArticalCell class])];
    
    self.dataArray = [ArticalModel getDataArray];
    
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticalCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ArticalCell class]) forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailsArticalController *detail = [DetailsArticalController new];
    [self.navigationController pushViewController:detail animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

//
//  ArticleViewController.m
//  JHRecruit
//
//  Created by milan on 2017/10/25.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "ArticleViewController.h"
#import "ArticalCell.h"


@interface ArticleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *dataArray;


@end


@implementation ArticleViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.frame = self.view.bounds;
    self.tableView.estimatedRowHeight = 40;
    self.tableView.insetsContentViewsToSafeArea = false;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[ArticalCell class] forCellReuseIdentifier:NSStringFromClass([ArticalCell class])];
    
    self.dataArray = [ArticalModel getDataArray];
    
    
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ArticalCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ArticalCell class]) forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

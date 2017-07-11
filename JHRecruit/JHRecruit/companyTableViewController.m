//
//  companyTableViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/24.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "companyTableViewController.h"
#import "MyLayout.h"
#import "companyTableViewCell.h"
#import "JHTool.h"
@interface companyTableViewController ()

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation companyTableViewController
#pragma mark - 数据源懒加载
-(NSMutableArray*)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
        NSArray *imgArray = @[@"logo1",@"logo2",@"logo3",@"logo4"];
        NSArray *nameArray = @[@"禾米科技",@"明月镜像",@"宜良国际科技公司",@"掌阅科技单机竞技"];
        NSArray *addressArray = @[@"广州天河区",@"广州天河区棠下",@"广州番禺",@"广州市天河区洗村"];
        NSArray *typeArray = @[@"移动互联",@"互联网",@"IT软件",@"教育培训"];
        NSArray *scaleArray = @[@"A轮",@"未融资",@"不需要融资",@"已上市"];
        
        
        for (int i = 0; i<15; i++) {
            companyModel *model = [companyModel new];
            model.headerImg = imgArray[arc4random_uniform(4)];
            model.companyName = nameArray[arc4random_uniform(4)];
            model.address = addressArray[arc4random_uniform(4)];
            model.type = typeArray[arc4random_uniform(4)];
            model.scale = scaleArray[arc4random_uniform(4)];
            
            [_dataArray addObject:model];
        }
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"公司";
    self.navigationController.navigationBar.barTintColor = [JHTool color:18 widthGreen:150 widthBlue:219 alpha:1];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.view.backgroundColor = [JHTool thisAppBackgroundColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //提高cell高度的精确度
    self.tableView.estimatedRowHeight = 60;
    
    //设置所有的cell高度自适应
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerClass:[companyTableViewCell class] forCellReuseIdentifier:@"milan"];
  }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    companyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"milan" forIndexPath:indexPath];
    cell.model = _dataArray[indexPath.row];
   
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //高度自适应
    return UITableViewAutomaticDimension;
}
@end

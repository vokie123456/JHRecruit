//
//  persionalViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/11.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "persionalViewController.h"
#import "recruitDataModel.h"
#import "persionalTableViewCell.h"
#import "JHTool.h"
#import "resumeViewController.h"
@interface persionalViewController ()

@property(nonatomic,strong) NSMutableArray *dataArray;


@end

@implementation persionalViewController



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
  // [self.navigationController setNavigationBarHidden:true animated:true];
   
  
 

}

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray new];
        
        NSArray *imgArray = @[@"img1.jpg",@"img2.jpg",@"img3.jpg"];
        NSArray *nameArray = @[@"梨花",@"华文",@"朱立洲"];
        NSArray *educationArray = @[@"大专",@"本科",@"研究生"];
        NSArray *targetArray = @[@"IOS",@"安卓",@"HTML"];
        NSArray *experienceArray = @[@"1年",@"2年",@"2.5年"];
        NSArray *wageArray = @[@"2-3K", @"10-12K", @"5-6K"];
        
        for (int i = 0; i<15; i++) {
            
            persionalDataModel *model = [persionalDataModel new];
            model.headerImg = imgArray[arc4random_uniform((uint32_t)imgArray.count)];
            
            model.nickName = nameArray[arc4random_uniform((uint32_t)nameArray.count)];
            
            model.education = educationArray[arc4random_uniform((uint32_t)educationArray.count)];
            
            model.target = targetArray[arc4random_uniform((uint32_t)targetArray.count)];
            
            model.experience = experienceArray[arc4random_uniform((uint32_t)experienceArray.count)];
            
              model.wage = wageArray[arc4random_uniform((uint32_t)wageArray.count)];
            
            
            [_dataArray addObject:model];
        }
        
    }
    
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人";
    self.view.backgroundColor = [JHTool thisAppBackgroundColor];
    self.navigationController.navigationBar.barTintColor = [JHTool thisAppTintColor];
      self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    
    UITableView *tableView = [[UITableView alloc]init];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [JHTool color:229 widthGreen:226 widthBlue:226 alpha:0.5];
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0);
    self.view = tableView;
    _tableView = tableView;
    
    //提高cell高度的精确度
    _tableView.estimatedRowHeight = 60;
    
    //设置所有cell的高度为高度自适应，如果cell高度是动态的请这么设置。 如果不同的cell有差异那么可以通过实现协议方法-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    //如果您最低要支持到iOS7那么请您实现-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath方法来代替这个属性的设置。
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [_tableView registerClass:[persionalTableViewCell class] forCellReuseIdentifier:@"milan"];

    
   
    
 }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
   
    return self.dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    persionalTableViewCell *cell = (persionalTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"milan" forIndexPath:indexPath];
    
    persionalDataModel *model = _dataArray[indexPath.row];
    cell.model = model;
    
    return cell;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.hidesBottomBarWhenPushed = true;
    resumeViewController *resume = [[resumeViewController alloc]init];
    
    [self.navigationController pushViewController:resume animated:true];
   self.hidesBottomBarWhenPushed = false;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

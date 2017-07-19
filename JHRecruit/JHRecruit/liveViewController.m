//
//  liveViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "liveViewController.h"
#import "JHPlayerView.h"
#import "AFNetworking.h"
#import "LiveModel.h"
#import "MJExtension.h"
#import "liveTableViewCell.h"
#import "JHTool.h"
#import "showingViewController.h"
@interface liveViewController ()<UITableViewDelegate,UITableViewDataSource>
    @property(nonatomic,strong)UITableView *tableView;
    @property(nonatomic,strong)NSMutableArray *dataArray;
    @end

@implementation liveViewController
    

    
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.title = @"直播";
    self.navigationController.navigationBar.barTintColor = [JHTool thisAppTintColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    _tableView = [[UITableView alloc]init];
    self.view = _tableView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //提高cell高度精确度
    _tableView.estimatedRowHeight = 60;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView registerClass:[liveTableViewCell class] forCellReuseIdentifier:@"milan"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [JHTool thisAppBackgroundColor];
    [_tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    
    
    
}
    

    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
-(void)loadData
    {
        NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=2";
        
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFJSONResponseSerializer serializer];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
        
        [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            _dataArray = [LiveModel mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
            [_tableView reloadData];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
        }];
        
    }
    
    
#pragma mark -- tableView代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
    {
        return 1;
    }
    
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    {
        NSLog(@"%ld",_dataArray.count);
        return _dataArray.count;
    }
    
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        liveTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"milan" forIndexPath:indexPath];
        cell.model = _dataArray[indexPath.row];
        
        return cell;
    }
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        return UITableViewAutomaticDimension;
    }
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
    {
        LiveModel *model = _dataArray[indexPath.row];
        showingViewController *show = [[showingViewController alloc]init];
        show.streamAddress = model.stream_addr;
        [self presentViewController:show animated:true completion:nil];
       
        
    }
    @end

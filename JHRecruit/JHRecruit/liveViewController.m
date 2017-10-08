//
//  liveViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "liveViewController.h"
#import "JHPlayerView.h"
#import "LiveModel.h"
#import "MJExtension.h"
#import "liveTableViewCell.h"
#import "showingViewController.h"
#import "liveCreater.h"
#import "liveToolView.h"
#import "mainLiveViewController.h"
#import "SVProgressHUD.h"



@interface liveViewController ()<UITableViewDelegate,UITableViewDataSource>
    @property(nonatomic,strong)UITableView *tableView;
    @property(nonatomic,strong)NSMutableArray *dataArray;
    @property(nonatomic,strong)UIButton *liveBtn;
    @property(nonatomic,strong)liveToolView *liveView;
    @end

@implementation liveViewController
    

    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"直播";
    self.navigationController.navigationBar.barTintColor = [JHTool thisAppTintColor];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    MyFrameLayout *frameLayout = [[MyFrameLayout alloc]init];
    self.view = frameLayout;
    
    _tableView = [[UITableView alloc]init];
    _tableView.myMargin = 0;
    [frameLayout addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //提高cell高度精确度
    _tableView.estimatedRowHeight = 60;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [_tableView registerClass:[liveTableViewCell class] forCellReuseIdentifier:@"milan"];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [JHTool thisAppBackgroundColor];
    [_tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    
    UIButton *liveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    liveBtn.myRight = 5;
    liveBtn.myBottom = 50;
    liveBtn.mySize = CGSizeMake(50, 50);
    [liveBtn setBackgroundImage:[UIImage imageNamed:@"toolIcon"] forState:UIControlStateNormal];
    [liveBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [frameLayout addSubview:liveBtn];
    self.liveBtn = liveBtn;
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    [_tableView.mj_header beginRefreshing];
    
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter]addObserverForName:@"floatBtnShow" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.liveBtn.hidden = false;
        
    }];
    
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
            [_tableView.mj_header endRefreshing];
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
        show.backgrondImg = model.creator.portrait;
        [self presentViewController:show animated:true completion:nil];
       
        
    }



-(void)btnClick
{
    _liveView = [[liveToolView alloc]init];
    _liveView.frame = [[UIScreen mainScreen] bounds];
    [[[UIApplication sharedApplication] keyWindow] addSubview:_liveView];



        //悬浮按钮
    _liveBtn.hidden = true;
    
    
}


    @end

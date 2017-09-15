//
//  companyDetalsController.m
//  JHRecruit
//
//  Created by milan on 2017/8/22.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "companyDetalsController.h"
#import "SDCycleScrollView.h"
#import "companyDetailsCell.h"
#import "HeaderLineView.h"
#import "companyStatusCell.h"
#import "positionModel.h"
#import "workPositionCell.h"
#import "positionDetailController.h"

@interface companyDetalsController ()<HeaderLineDelegate,UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UIScrollView *scroll;
@property(nonatomic,strong)MyLinearLayout *rootView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)HeaderLineView *headerLine;
@property(nonatomic,assign)BOOL isShowLabel;
@property(nonatomic,strong)NSMutableArray *positionArray;
@end

@implementation companyDetalsController

-(UITableView*)tableView{
    if (!_tableView) {
        _currentIndex = 0;
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [JHTool thisAppBackgroundColor];
       
        self.view = _tableView;
        
    }
    return _tableView;
}
-(NSMutableArray*)positionArray{
    if (!_positionArray) {
        _positionArray = [NSMutableArray array];
        
        NSArray *workArray = @[@"IOS实习生",@"安卓实习生",@"项目架构师",@"运行维护员"];
        NSArray *companyArray = @[@"融合科技",@"可果儿公司",@"尤新亚集团",@"雅士服饰"];
        NSArray *locationArray = @[@"北京",@"广州",@"深圳",@"杭州"];
        NSArray *educationArray = @[@"专科",@"本科",@"研究生",@"不限"];
        NSArray *experienceArray = @[@"1-2年",@"2-3年",@"4-5年",@"不限"];
        NSArray *wageArray = @[@"2-3K",@"3-4K",@"7-8K",@"面议"];
        
        
        for (int i = 0; i< 15; i++) {
            
            positionModel *model = [positionModel new];
            model.positionName = workArray[arc4random_uniform((uint32_t)workArray.count)];
            model.companyName = companyArray[arc4random_uniform((uint32_t)companyArray.count)];
            model.location = locationArray[arc4random_uniform((uint32_t)locationArray.count)];
            model.education = educationArray[arc4random_uniform((uint32_t)educationArray.count)];
            model.experience = experienceArray[arc4random_uniform((uint32_t)experienceArray.count)];
            model.wage = wageArray[arc4random_uniform((uint32_t)wageArray.count)];
            [_positionArray addObject:model];
            
        }
        
    }
    
    return _positionArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"公司详情";
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 60;
    [self createTableHeaderView];
    [_tableView registerClass:[companyStatusCell class] forCellReuseIdentifier:NSStringFromClass([companyStatusCell class])];
    [_tableView registerClass:[workPositionCell class] forCellReuseIdentifier:NSStringFromClass([workPositionCell class])];
    _tableView.estimatedRowHeight = 44;
  
    
    
    
    
    
}
#pragma mark -- sectionView
-(void)didSelectItemWithIndex:(NSInteger)index{
   
    _currentIndex = index;
    [_tableView setContentOffset:CGPointMake(0, -100) animated:false];
    [_tableView reloadData];
   
    
    
    
    
}

#pragma mark -- tableView代理
-(void)createTableHeaderView{
    
    //头部视图布局
    MyLinearLayout *headerView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    headerView.gravity = MyGravity_Horz_Fill;
    headerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.tableView.bounds), 0);//高度不确定先设置为0
    headerView.myHorzMargin = 0;
    
    
    SDCycleScrollView *cycleScrollView = [[SDCycleScrollView alloc]init];
    cycleScrollView.imageURLStringsGroup = @[@"companyImg1.png",@"companyImg2.png",@"companyImg3.png"];
    cycleScrollView.myHeight = 200;
    cycleScrollView.currentPageDotColor = [JHTool thisAppTintColor];
    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    [headerView addSubview:cycleScrollView];
    
    companyDetailsCell *infoCell = [[companyDetailsCell alloc]init];
    infoCell.wrapContentHeight = true;
    infoCell.backgroundColor = [UIColor whiteColor];
    [headerView addSubview:infoCell];
    
    MyBorderline *borderLine = [[MyBorderline alloc]init];
    borderLine.color = [UIColor lightGrayColor];
    infoCell.bottomBorderline = borderLine;
    
    
    
    [headerView layoutIfNeeded];////因为高度是wrap的，所以这里必须要在加入前执行这句！！！ 原因是tableHeaderView必须要明确的指定frame。所以通过layoutIfNeeded来算出真实视图真实的frame值。因为tableHeaderViewLayout这时候并没有父视图，所以这里必须要明确的通过frame指定宽度，这样最终的计算结果才正确。
    
    
    
    self.tableView.tableHeaderView = headerView;
   

    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_currentIndex == 0) {
        return 1;
    }else{
        return self.positionArray.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return UITableViewAutomaticDimension;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (_currentIndex == 0 && indexPath.row == 0) {
        companyStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([companyStatusCell class]) forIndexPath:indexPath];
        NSString *contentStr =@"你在飞机刷卡缴费开始减肥开始是否合适客户付款是否可还是发生开放和考试分开收到货付款你在飞机刷卡缴费开始减肥开始是否合适客户付款是否可还是发生开放和考试分开收到货付款你在飞机刷卡缴费开始减肥开始是否合适客户付款是否可还是发生开放和考试分开收到货付款你在飞机刷卡缴费开始减肥开始是否合适客户付款是否可还是发生开放和考试分开收到货付款你在飞机刷卡缴费开始减肥开始是否合适客户付款";
        
        cell.contentStr = contentStr;
        cell.isShowLabel = _isShowLabel;
        return cell;
    }else{
        workPositionCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([workPositionCell class]) forIndexPath:indexPath];
        
        cell.model = _positionArray[indexPath.row];
        return cell;
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    if (!_headerLine) {
        HeaderLineView *headerLine = [[HeaderLineView alloc]init];
        headerLine.delegate = self;
        headerLine.titleArray = @[@"公司概况",@"招聘职位"];
        headerLine.borderLineColor = [JHTool thisAppTintColor];
        _headerLine = headerLine;
    }
    
    return _headerLine;
    
  
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 46;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_currentIndex == 0) {
        companyStatusCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        _isShowLabel = !_isShowLabel;
        cell.isShowLabel = _isShowLabel;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else{
        positionDetailController *positionController = [[positionDetailController alloc]init];
        
        [self.navigationController pushViewController:positionController animated:true];
    }
}


@end

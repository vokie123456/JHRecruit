//
//  recruitViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "recruitViewController.h"

#import <MyLayout/MyLayout.h>
#import "JHTool.h"


@interface recruitViewController ()<UIScrollViewDelegate>

@end

@implementation recruitViewController




- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.barTintColor = [JHTool color:18 widthGreen:150 widthBlue:219 alpha:1];
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
  

   
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    self.automaticallyAdjustsScrollViewInsets = false;
    
    
    [self setLayout];
   

   
    
}



-(void)segmentClick{
    if (_segment.selectedSegmentIndex == 0) {
        [_scroll setContentOffset:CGPointMake(0, 0) animated:true];
    }else if (_segment.selectedSegmentIndex == 1){
        [_scroll setContentOffset:CGPointMake(self.view.frame.size.width, 0) animated:true];
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.contentOffset.x == 0) {
        _segment.selectedSegmentIndex = 0;
    }else if (scrollView.contentOffset.x == self.view.frame.size.width){
        _segment.selectedSegmentIndex = 1;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setLayout{
    
  
    _segment = [[UISegmentedControl alloc]initWithItems:@[@"个人",@"公司"]];
    _segment.frame = CGRectMake(0, 0, 200, 30);
    _segment.tintColor = [UIColor whiteColor];
    _segment.selectedSegmentIndex = 0;
    [_segment addTarget:self action:@selector(segmentClick) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = _segment;
    
  
    
    
    
    
    _scroll = [[UIScrollView alloc]init];
    _scroll.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);

    _scroll.pagingEnabled = true;
    _scroll.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*2, self.view.frame.size.height);
    _scroll.delegate = self;
    _scroll.bounces = false;
    _scroll.alwaysBounceVertical = false;
    _scroll.showsVerticalScrollIndicator = false;
    [self.view addSubview:_scroll];
    
    _persional = [[persionalViewController alloc]init];
    
   
    [self addChildViewController:_persional];

    
    
    
    _persional.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
  
    [_scroll addSubview:_persional.view];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"点击" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(100, 100, 100, 40);
 
    
   


}
-(void)btnClick{
    self.hidesBottomBarWhenPushed = true;
    persionalViewController *persional = [[persionalViewController alloc]init];
    
    [self.navigationController pushViewController:persional animated:true];
    
    self.hidesBottomBarWhenPushed = false;
}


@end

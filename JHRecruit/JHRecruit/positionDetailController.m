//
//  positionDetailController.m
//  JHRecruit
//
//  Created by milan on 2017/9/13.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "positionDetailController.h"
#import "itemView.h"
#import "companyDetailsCell.h"
#import "interViewQuestionController.h"

@interface positionDetailController ()


@property(nonatomic,strong)MyFrameLayout *frameLayout;
@property(nonatomic,strong)UIScrollView *scrollView;
@property(nonatomic,strong)MyLinearLayout *contentLayout;

@property(nonatomic,strong)UIButton *interViewBtn;

@property(nonatomic,strong)itemView *locationItem;
@property(nonatomic,strong)itemView *experienceItem;
@property(nonatomic,strong)itemView *educationItem;

@property(nonatomic,strong)UILabel *dutyLabel;
@property(nonatomic,strong)UILabel *demandLabel;


@end

@implementation positionDetailController

-(void)loadView{
    
    MyFrameLayout *frameLayout = [[MyFrameLayout alloc]init];
    frameLayout.backgroundColor = [JHTool thisAppBackgroundColor];
    self.view = frameLayout;
    self.frameLayout = frameLayout;
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.myMargin = 0;
    scrollView.alwaysBounceVertical = true;
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
    
    UIButton *interViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [interViewBtn setTitle:@"面试" forState:UIControlStateNormal];
    interViewBtn.backgroundColor = [JHTool thisAppTintColor];
    interViewBtn.titleLabel.textColor = [UIColor whiteColor];
    interViewBtn.myHeight = 60;
    interViewBtn.myWidth = 60;
    interViewBtn.myBottom = 20;
    interViewBtn.myCenterX = 0;
    interViewBtn.layer.cornerRadius = 30;
    [interViewBtn addTarget:self action:@selector(tranformToInterViewController) forControlEvents:UIControlEventTouchUpInside];
    [frameLayout addSubview:interViewBtn];
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myHorzMargin = 0;
    contentLayout.gravity = MyGravity_Horz_Fill;

    [scrollView addSubview:contentLayout];
    
    [self addHeaderLayout:contentLayout];
    [self addThePositionDetails:contentLayout];
        
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"职位详情";
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)addHeaderLayout:(MyLinearLayout*)contentLayout{
    MyFloatLayout *floatLayout = [[MyFloatLayout alloc]initWithOrientation:MyOrientation_Vert];
    floatLayout.wrapContentHeight = true;
    floatLayout.backgroundColor = [UIColor whiteColor];
    floatLayout.padding = UIEdgeInsetsMake(30, 10, 10, 10);
    floatLayout.subviewHSpace = 10;
    [contentLayout addSubview:floatLayout];
    
    UILabel *positionName = [UILabel new];
    positionName.text = @"IOS实习生";
    positionName.font = [JHTool weightFont:18];
    [positionName sizeToFit];
    [floatLayout addSubview:positionName];
    
    UILabel *wageLabel = [UILabel new];
    wageLabel.text = @"3K-4K";
    wageLabel.font = [JHTool font:18];
    wageLabel.textColor = [UIColor orangeColor];
    [wageLabel sizeToFit];
    wageLabel.myLeft = 10;
    [floatLayout addSubview:wageLabel];
    

    
    _locationItem = [[itemView alloc]initWithImg:[UIImage imageNamed:@"locationIcon"] withTitle:@"广州"];
    _locationItem.myTop = 20;
    _locationItem.clearFloat = true;
    [floatLayout addSubview:_locationItem];
    
    _experienceItem = [[itemView alloc]initWithImg:[UIImage imageNamed:@"experienceIcon"] withTitle:@"1-2年"];
    _experienceItem.myTop = 20;
    [floatLayout addSubview:_experienceItem];
    
    _educationItem = [[itemView alloc]initWithImg:[UIImage imageNamed:@"educationIcon"] withTitle:@"不限"];
    _educationItem.myTop = 20;
    [floatLayout addSubview:_educationItem];
    
    companyDetailsCell *companyCell = [[companyDetailsCell alloc]init];
    companyCell.clearFloat = true;
    companyCell.weight = 1;
    companyCell.wrapContentHeight = true;
    companyCell.myTop = 10;
    [floatLayout addSubview:companyCell];
    
    MyBorderline *borderLine = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
    companyCell.topBorderline = borderLine;
    
    
}

-(void)addThePositionDetails:(MyLinearLayout*)contentLayout{
    MyLinearLayout *positionLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    positionLayout.myTop = 10;
    positionLayout.myBottom = 50;
    positionLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    positionLayout.backgroundColor = [UIColor whiteColor];
    [contentLayout addSubview:positionLayout];
    
    MyLinearLayout *titleLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    titleLayout.wrapContentHeight = true;
    titleLayout.myHorzMargin = 0;
    titleLayout.gravity = MyGravity_Vert_Center;
    titleLayout.padding = UIEdgeInsetsMake(0, 0, 10, 0);
    [positionLayout addSubview:titleLayout];
    
    UIImageView *titleImg = [UIImageView new];
    titleImg.image = [UIImage imageNamed:@"detailsIcon"];
    titleImg.mySize = CGSizeMake(20, 20);
    [titleLayout addSubview:titleImg];
    
    UILabel *titleLable = [UILabel new];
    titleLable.text = @"职位详情";
    titleLable.font = [JHTool font:18];
    [titleLable sizeToFit];
    titleLable.myLeft = 10;
    [titleLayout addSubview:titleLable];
    
    MyBorderline *borderLine = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
    titleLayout.bottomBorderline = borderLine;
    
    
    UILabel *dutyTitle = [UILabel new];
    dutyTitle.text = @"岗位职责:";
    dutyTitle.font = [JHTool font:14];
    dutyTitle.myTop = 10;
    [dutyTitle sizeToFit];
    dutyTitle.textColor = [UIColor lightGrayColor];
    [positionLayout addSubview:dutyTitle];
    
   
    NSString *dutyContent = @"1.负责IOS版本SDK开发、版本迭代、优化升级等相关工作;\n2.撰写SDK接入FAQ、产品维护文档，用户帮助文档等;\n3.负责完成游戏的出包等相关工作";
    
    
    _dutyLabel = [UILabel new];
    _dutyLabel.myHorzMargin = 0;
    _dutyLabel.wrapContentHeight = true;
    _dutyLabel.myTop = 10;
    _dutyLabel.attributedText = [self changeTheLineSpace:dutyContent];
    _dutyLabel.font = [JHTool font:14];
    _dutyLabel.textColor = [UIColor lightGrayColor];
    [positionLayout addSubview:_dutyLabel];
    
    UILabel *demandTitle = [UILabel new];
    demandTitle.text = @"职位要求:";
    demandTitle.font = [JHTool font:14];
    demandTitle.textColor = [UIColor lightGrayColor];
    demandTitle.myTop = 20;
    [demandTitle sizeToFit];
    [positionLayout addSubview:demandTitle];
    
    
    NSString *demandContent = @"1.有良好的Object-基础，熟悉IOS SDK，有IOS开发经验的优先考虑\n2.熟悉IOS开发平台及框架原理，IOS应用实现机制\n3.学习能力强，有高度责任心和执行力，愿意提高自身综合能力";
    _demandLabel = [UILabel new];
    _demandLabel.font = [JHTool font:14];
    _demandLabel.myTop = 10;
    _demandLabel.attributedText = [self changeTheLineSpace:demandContent];
    _demandLabel.textColor = [UIColor lightGrayColor];
    _demandLabel.myHorzMargin = 0;
    _demandLabel.wrapContentHeight = true;
    [positionLayout addSubview:_demandLabel];
    
    
    
    
  
}

-(void)tranformToInterViewController{
    interViewQuestionController *questionController = [[interViewQuestionController alloc]init];
    questionController.questionContent = @"1.请问您对我们公司的印象是怎么样的?\n2.你对这个职位有什么期望？";
    
    
    [self.navigationController pushViewController:questionController animated:true];
}


//更改行距
-(NSMutableAttributedString*)changeTheLineSpace:(NSString *)textContent{
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc]initWithString:textContent];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:10];
    [attString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attString.length)];
    
    
    return attString;
}

@end

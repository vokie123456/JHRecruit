//
//  resumeViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/16.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "resumeViewController.h"
#import "JHTool.h"
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "JHPlayerView.h"
#import "MyLayout.h"
#import "itemView.h"
@interface resumeViewController ()
    
    @property(nonatomic, strong)MyFrameLayout *frameLayout;
    @property(nonatomic, strong)UIImageView *headerImg;
    @property(nonatomic, strong)UILabel *nickName;
    @property(nonatomic, strong)itemView *experienceItem;
    @property(nonatomic, strong)itemView *educationItem;
    @property(nonatomic, strong)itemView *wageItem;
    @property(nonatomic, strong)JHPlayerView *playerView;
    
    
    @end

@implementation resumeViewController
-(void)viewDidAppear:(BOOL)animated{
 
}
    
-(void)loadView{
    /*
     在控制器加载的时候改变self.view
     */
    
    MyFrameLayout *frameLayout = [MyFrameLayout new];
    frameLayout.backgroundColor = [UIColor whiteColor];
    self.view = frameLayout;
    self.frameLayout = frameLayout;
    
    UIScrollView *scroll = [UIScrollView new];
    scroll.myMargin = 0;
    scroll.alwaysBounceVertical = true;
    scroll.backgroundColor = [JHTool thisAppBackgroundColor];
    [self.view addSubview:scroll];//高度自动适应
    
    UIButton *btn = [UIButton new];
    [btn setTitle:@"立刻沟通" forState:UIControlStateNormal];
    btn.backgroundColor = [JHTool color:102 widthGreen:205 widthBlue:170 alpha:1];
    btn.titleLabel.font = [JHTool font:16];
    btn.tintColor = [UIColor whiteColor];
    btn.myHeight = 50;
    btn.myHorzMargin = 0;//设置水平边距为0，宽度固定
    btn.myBottom = 0;
    [self.view addSubview:btn];
    
    //整体为线性布局
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myHorzMargin = 0;//设置水平边距为0，固定宽度
    contentLayout.gravity = MyGravity_Horz_Fill;//设置子视图宽度与父视图相等
    contentLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    [scroll addSubview:contentLayout];
    
    
    [self addTheHeaderLayout:contentLayout];
    [self addTheRecruitMovie:contentLayout];
    [self addTheWorkExpectation:contentLayout];
    [self addTheEducationBackground:contentLayout];
    [self addTheWorkExperience:contentLayout];
    [self addTheProjectExperience:contentLayout];
    
   }
    
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人简历";
 
    
    
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}
    
-(void)viewWillDisappear:(BOOL)animated{
    [_playerView.ijkPlayer shutdown];

}
    

#pragma mark - 布局模块
-(void)addTheHeaderLayout:(MyLinearLayout *)contentLayout
    {
        MyRelativeLayout *relative = [MyRelativeLayout new];
        relative.myHorzMargin = 0;
        relative.wrapContentHeight = true;
        relative.backgroundColor = [UIColor whiteColor];
        relative.padding = UIEdgeInsetsMake(5, 5, 5, 5);
        [contentLayout addSubview:relative];
        
        _headerImg = [UIImageView new];
        _headerImg.myWidth = 70;
        _headerImg.myHeight = 80;
        _headerImg.image = [UIImage imageNamed:@"img1"];
        _headerImg.myLeft = 10;
        [relative addSubview:_headerImg];
        
        _nickName = [UILabel new];
        _nickName.text = @"糜烂的东西";
        _nickName.font = [JHTool weightFont:18];
        [_nickName sizeToFit];
        _nickName.leftPos.equalTo(_headerImg.rightPos).offset(10);
        [relative addSubview:_nickName];
        
        MyLinearLayout *infoLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
        infoLayout.wrapContentSize = true;
        infoLayout.leftPos.equalTo(_nickName.leftPos);
        infoLayout.topPos.equalTo(_nickName.bottomPos).offset(10);
        infoLayout.subviewHSpace = 10;
        [relative addSubview:infoLayout];
        
        _educationItem = [[itemView alloc]initWithImg:[UIImage imageNamed:@"educationIcon"] withTitle:@"本科"];
        [infoLayout addSubview:_educationItem];
        
        _experienceItem = [[itemView alloc]initWithImg:[UIImage imageNamed:@"experienceIcon"] withTitle:@"1-2年"];
        [infoLayout addSubview:_experienceItem];
        
        _wageItem = [[itemView alloc]initWithImg:[UIImage imageNamed:@"wageIcon"] withTitle:@"3-4K"];
        [infoLayout addSubview:_wageItem];
        
        
        
        
        UILabel *state = [UILabel new];
        state.text = @"随时到岗";
        state.font = [JHTool font:14];
        state.textColor = [UIColor lightGrayColor];
        state.leftPos.equalTo(_nickName.leftPos);
        state.topPos.equalTo(infoLayout.bottomPos).offset(10);
        [state sizeToFit];
        [relative addSubview:state];
        
        
    }
    
    
    
-(void)addTheRecruitMovie:(MyLinearLayout *)contentLayout
    {
        MyLinearLayout *movieLayout = [self createInfoContentLayoutWithImgName:@"movieIcon" withTitle:@"视频简介"];
        [contentLayout addSubview:movieLayout];
        
        
        
        NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:@"testMovie" withExtension:@"mp4"];
        _playerView = [[JHPlayerView alloc]initWithUrl:fileUrl withPlayerType:JHVideo];
        _playerView.myHeight = 200;
        _playerView.myHorzMargin = 0;
        [movieLayout addSubview:_playerView];
        
        
        
        
    }
    
-(void)addTheWorkExpectation:(MyLinearLayout *)contentLayout
    {
        MyLinearLayout *WorkExpectation = [self createInfoContentLayoutWithImgName:@"expectationIcon" withTitle:@"工作意向"];
        [contentLayout addSubview:WorkExpectation];
        
        
        MyRelativeLayout *infoLayout = [[MyRelativeLayout alloc]init];
        infoLayout.myHorzMargin = 0;
        infoLayout.wrapContentHeight = true;
        infoLayout.backgroundColor = [UIColor whiteColor];
        infoLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [WorkExpectation addSubview:infoLayout];
        
        UILabel *expectation = [UILabel new];
        expectation.text = @"IOS工程师";
        expectation.font = [JHTool font:14];
        [expectation sizeToFit];
        [infoLayout addSubview:expectation];
        
        UILabel *wage = [UILabel new];
        wage.text = @"2-3K";
        wage.font = [JHTool weightFont:14];
        wage.textColor = [UIColor lightGrayColor];
        wage.rightPos.equalTo(infoLayout.rightPos);
        wage.bottomPos.equalTo(expectation.bottomPos);
        [wage sizeToFit];
        [infoLayout addSubview:wage];
        
        UILabel *major = [UILabel new];
        major.text = @"广州";
        major.font = [JHTool font:12];
        major.textColor = [UIColor lightGrayColor];
        [major sizeToFit];
        major.topPos.equalTo(expectation.bottomPos).offset(10);
        [infoLayout addSubview:major];
    }
    
-(void)addTheEducationBackground:(MyLinearLayout *)contentLayout
    {
        MyLinearLayout *educationLayout = [self createInfoContentLayoutWithImgName:@"educationIcon" withTitle:@"教育背景"];
        [contentLayout addSubview:educationLayout];
        
        
        MyRelativeLayout *infoLayout = [[MyRelativeLayout alloc]init];
        infoLayout.myHorzMargin = 0;
        infoLayout.wrapContentHeight = true;
        infoLayout.backgroundColor = [UIColor whiteColor];
        infoLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [educationLayout addSubview:infoLayout];
        
        UILabel *school = [UILabel new];
        school.text = @"广东农工商职业技术学院";
        school.font = [JHTool font:14];
        [school sizeToFit];
        [infoLayout addSubview:school];
        
        UILabel *time = [UILabel new];
        time.text = @"2015-2018";
        time.font = [JHTool font:14];
        time.textColor = [UIColor lightGrayColor];
        time.rightPos.equalTo(infoLayout.rightPos);
        time.bottomPos.equalTo(school.bottomPos);
        [time sizeToFit];
        [infoLayout addSubview:time];
        
        UILabel *major = [UILabel new];
        major.text = @"移动互联网应用技术";
        major.font = [JHTool font:12];
        major.textColor = [UIColor lightGrayColor];
        [major sizeToFit];
        major.topPos.equalTo(school.bottomPos).offset(10);
        [infoLayout addSubview:major];
        
        
        
    }
    
    
-(void)addTheWorkExperience:(MyLinearLayout *)contentLayout
    {
        MyLinearLayout *experienceLayout = [self createInfoContentLayoutWithImgName:@"experienceIcon" withTitle:@"工作经历"];
        [contentLayout addSubview:experienceLayout];
        
        MyRelativeLayout *infoLayout = [[MyRelativeLayout alloc]init];
        infoLayout.myHorzMargin = 0;
        infoLayout.wrapContentHeight = true;
        infoLayout.backgroundColor = [UIColor whiteColor];
        infoLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [experienceLayout addSubview:infoLayout];
        
        UILabel *company = [UILabel new];
        company.text = @"HK技术空间";
        company.font = [JHTool font:14];
        [company sizeToFit];
        [infoLayout addSubview:company];
        
        UILabel *time = [UILabel new];
        time.text = @"2015-2018";
        time.font = [JHTool font:14];
        time.textColor = [UIColor lightGrayColor];
        time.rightPos.equalTo(infoLayout.rightPos);
        time.bottomPos.equalTo(company.bottomPos);
        [time sizeToFit];
        [infoLayout addSubview:time];
        
        
        UILabel *workcontentLabel = [UILabel new];
        workcontentLabel.text = @"工作内容:";
        workcontentLabel.font = [JHTool font:12];
        workcontentLabel.textColor = [UIColor lightGrayColor];
        workcontentLabel.topPos.equalTo(company.bottomPos).offset(10);
        [workcontentLabel sizeToFit];
        [infoLayout addSubview:workcontentLabel];
        
        
        UILabel *workContent = [UILabel new];
        workContent.text = @"负责独立开发IOS应用";
        workContent.font = [JHTool font:12];
        workContent.textColor = [UIColor lightGrayColor];
        [workContent sizeToFit];
        workContent.topPos.equalTo(workcontentLabel.bottomPos).offset(15);
        [infoLayout addSubview:workContent];
        
        
        
    }
    
-(void)addTheProjectExperience:(MyLinearLayout *)contentLayout
    {
        MyLinearLayout *projectLayout = [self createInfoContentLayoutWithImgName:@"projectIcon" withTitle:@"项目经历"];
        projectLayout.myBottom = 50;
        [contentLayout addSubview:projectLayout];
        
        MyRelativeLayout *infoLayout = [[MyRelativeLayout alloc]init];
        infoLayout.myHorzMargin = 0;
        infoLayout.wrapContentHeight = true;
        infoLayout.backgroundColor = [UIColor whiteColor];
        infoLayout.padding = UIEdgeInsetsMake(10, 10, 10, 10);
        [projectLayout addSubview:infoLayout];
        
        UILabel *projectLabel = [UILabel new];
        projectLabel.text = @"XXX项目";
        projectLabel.font = [JHTool font:14];
        [projectLabel sizeToFit];
        [infoLayout addSubview:projectLabel];
        
        UILabel *time = [UILabel new];
        time.text = @"2015-2018";
        time.font = [JHTool font:14];
        time.textColor = [UIColor lightGrayColor];
        time.rightPos.equalTo(infoLayout.rightPos);
        time.bottomPos.equalTo(projectLabel.bottomPos);
        [time sizeToFit];
        [infoLayout addSubview:time];
        
        UILabel *roleLable = [UILabel new];
        roleLable.text = @"担任角色:";
        roleLable.font = [JHTool font:14];
        roleLable.textColor = [UIColor lightGrayColor];
        roleLable.topPos.equalTo(projectLabel.bottomPos).offset(10);
        [roleLable sizeToFit];
        [infoLayout addSubview:roleLable];
        
        UILabel *role = [UILabel new];
        role.text = @"独立开发者";
        role.font = [JHTool font:14];
        role.textColor = [UIColor lightGrayColor];
        role.leftPos.equalTo(roleLable.rightPos).offset(10);
        role.topPos.equalTo(roleLable.topPos);
        [role sizeToFit];
        [infoLayout addSubview:role];
        
        UILabel *projectContentLable = [UILabel new];
        projectContentLable.text = @"项目内容:";
        projectContentLable.font = [JHTool font:14];
        projectContentLable.textColor = [UIColor lightGrayColor];
        projectContentLable.topPos.equalTo(roleLable.bottomPos).offset(10);
        [projectContentLable sizeToFit];
        [infoLayout addSubview:projectContentLable];
        
        UILabel *projectContent = [UILabel new];
        projectContent.text = @"一个十分小的项目，一个专门指向自我的邮件发送APP,许多人都是使用邮箱进行记录日常信息，这个款APP就是用于快速发送邮件到自己的邮箱，让我脱离发送邮件的繁琐步骤。";
        projectContent.font = [JHTool font:14];
        projectContent.textColor = [UIColor lightGrayColor];
        projectContent.leadingPos.equalTo(projectContentLable.rightPos).offset(10);
        projectContent.trailingPos.equalTo(infoLayout.rightPos);
        projectContent.topPos.equalTo(projectContentLable);
        projectContent.wrapContentHeight = true;
        [infoLayout addSubview:projectContent];
        
        
        
        
    }
    
    
-(MyLinearLayout *)createInfoBtnWithImgName:(NSString *)imgName withTitle:(NSString *)title
    {
        MyLinearLayout *itemLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
        itemLayout.wrapContentSize = true;
        
        UIImageView *imgView = [UIImageView new];
        imgView.image = [UIImage imageNamed:imgName];
        imgView.mySize = CGSizeMake(20, 20);
        [itemLayout addSubview:imgView];
        
        UILabel *titleLable = [UILabel new];
        titleLable.text = title;
        titleLable.font = [JHTool font:14];
        [titleLable sizeToFit];
        titleLable.myLeft = 5;
        [itemLayout addSubview:titleLable];
        
        
        return itemLayout;

        
    }
    
-(MyLinearLayout *)createInfoContentLayoutWithImgName:(NSString *)imgName withTitle:(NSString *)title
    {
        MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
        contentLayout.myHorzMargin = 0;
        contentLayout.wrapContentHeight = true;
        contentLayout.backgroundColor = [UIColor whiteColor];
        contentLayout.myTop = 10;
        
        
        MyLinearLayout *titleLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
        titleLayout.padding = UIEdgeInsetsMake(5, 5, 5, 5);
        titleLayout.backgroundColor = [UIColor whiteColor];
        titleLayout.myHorzMargin = 0;
        titleLayout.wrapContentHeight = true;
        [contentLayout addSubview:titleLayout];
        
        UIImageView *logo = [UIImageView new];
        logo.image = [UIImage imageNamed:imgName];
        logo.mySize = CGSizeMake(20, 20);
        [titleLayout addSubview:logo];
        
        UILabel *titleLbel = [UILabel new];
        titleLbel.text = title;
        titleLbel.font = [JHTool font:16];
        titleLbel.myLeft = 5;
        [titleLbel sizeToFit];
        [titleLayout addSubview:titleLbel];
        
        MyBorderline *borderLine = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
        titleLayout.bottomBorderline = borderLine;
        
        
        return contentLayout;
        
    }
    
    
    
    
    

    
    @end

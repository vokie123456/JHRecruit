//
//  settingViewController.m
//  JHRecruit
//
//  Created by milan on 2017/6/5.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "settingViewController.h"

@interface settingViewController ()<UIScrollViewDelegate>
{
    UIImageView *_navImageView;
    MyLinearLayout *_rootView;
    MyRelativeLayout *_headerView;
}

@end

@implementation settingViewController
-(void)loadView
{
    [super loadView];
  
    MyFrameLayout *frameLayout = [[MyFrameLayout alloc]init];
    frameLayout.backgroundColor = [JHTool thisAppBackgroundColor];
    self.view = frameLayout;
    
    
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.myMargin = 0;
    scrollView.alwaysBounceVertical = true;
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = false;
    [self.view addSubview:scrollView];
    
    //悬浮按钮
    UIButton *liveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    liveBtn.myRight = 5;
    liveBtn.myBottom = 50;
    liveBtn.mySize = CGSizeMake(50, 50);
    [liveBtn setBackgroundImage:[UIImage imageNamed:@"toolIcon"] forState:UIControlStateNormal];
    [liveBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [frameLayout addSubview:liveBtn];
    self.liveBtn = liveBtn;
    
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myHorzMargin = 0;
    contentLayout.gravity = MyGravity_Horz_Fill;//子视图里面的内容的宽度跟布局视图相等，这样子视图就不需要设置宽度了。
    contentLayout.heightSize.min(self.view.frame.size.height).add(20);
    [scrollView addSubview:contentLayout];
    
    UIView *backgroundView = [UIView new];
    backgroundView.backgroundColor = [JHTool thisAppTintColor];
    backgroundView.myHorzMargin = 0;
    backgroundView.myHeight = [UIScreen mainScreen].bounds.size.height/2;
    backgroundView.myTop = -([UIScreen mainScreen].bounds.size.height/2);
    [contentLayout addSubview:backgroundView];

    

    [self addHeaderLayout:contentLayout];
    [self addHeaderLayoutFooter:contentLayout];
    [self addCenterLayout:contentLayout];
    [self addFooterLayout:contentLayout];
   

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    __weak typeof(self) weakSelf = self;
    [[NSNotificationCenter defaultCenter]addObserverForName:@"floatBtnShow" object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
        weakSelf.liveBtn.hidden = false;
        
    }];

        
   
   }

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:true animated:true];
}

#pragma mark -- 布局代码
-(void)addHeaderLayout:(MyLinearLayout *)contentLayout
{
    MyRelativeLayout *headerLayout = [[MyRelativeLayout alloc]init];
    headerLayout.myHeight = [UIScreen mainScreen].bounds.size.height*0.23;
    headerLayout.backgroundColor = [JHTool thisAppTintColor];
    [contentLayout addSubview:headerLayout];
    
    UIImageView *headerIcon = [UIImageView new];
    headerIcon.image = [UIImage imageNamed:@"img1"];
    headerIcon.layer.borderColor = [JHTool color:225 widthGreen:255 widthBlue:255 alpha:1].CGColor;
    headerIcon.layer.borderWidth = 2;
    headerIcon.mySize = CGSizeMake(80, 80);
    headerIcon.layer.cornerRadius =  40;
    headerIcon.clipsToBounds = true;
    headerIcon.myCenterY = 0;
    headerIcon.myLeft = 40;
    [headerLayout addSubview:headerIcon];
    self.headerIcon = headerIcon;
    
    UILabel *nickName = [UILabel new];
    nickName.text = @"蓝色土耳其";
    nickName.font = [JHTool font:18];
    [nickName sizeToFit];
    nickName.textColor = [UIColor whiteColor];
    nickName.leftPos.equalTo(headerIcon.rightPos).offset(10);
    nickName.topPos.equalTo(headerIcon.topPos).offset(5);
    [headerLayout addSubview:nickName];
    self.nickName = nickName;
    
    
    UILabel *stateLabel = [UILabel new];
    stateLabel.text = @"随时到岗";
    stateLabel.textColor = [UIColor whiteColor];
    stateLabel.font = [JHTool font:15];
    stateLabel.topPos.equalTo(nickName.bottomPos).offset(10);
    stateLabel.leftPos.equalTo(nickName.leftPos);
    [stateLabel sizeToFit];
    [headerLayout addSubview:stateLabel];
    self.stateLabel = stateLabel;
    
    UIImageView *nextImg = [UIImageView new];
    nextImg.image = [UIImage imageNamed:@"nextIcon"];
    nextImg.mySize = CGSizeMake(40, 40);
    nextImg.rightPos.equalTo(headerLayout.rightPos).offset(10);
    nextImg.myCenterY = 0;
    [headerLayout addSubview:nextImg];
    
    
    
}

-(void)addHeaderLayoutFooter:(MyLinearLayout *)contentLayout
{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    layout.wrapContentHeight = true;
    layout.gravity = MyGravity_Horz_Fill;
    layout.backgroundColor = [UIColor whiteColor];
    layout.padding = UIEdgeInsetsMake(5, 0, 5, 0);
    [contentLayout addSubview:layout];
    
    MyLinearLayout *firstLayout = [self createFooterButtonLayoutWithNumber:4 withTitle:@"沟通过"];
    [layout addSubview:firstLayout];
    
    MyLinearLayout *secondLayout = [self createFooterButtonLayoutWithNumber:0 withTitle:@"已投递"];
    [layout addSubview: secondLayout];
    
    MyLinearLayout *thirdLayout = [self createFooterButtonLayoutWithNumber:0 withTitle:@"待面试"];
    [layout addSubview:thirdLayout];
    
    
}

-(void)addCenterLayout:(MyLinearLayout *)contentLayout
{
    MyFlowLayout *layout = [[MyFlowLayout alloc]initWithOrientation:MyOrientation_Vert arrangedCount:4];
    layout.gravity = MyGravity_Horz_Fill;
    layout.myTop = 20;
    layout.wrapContentHeight = true;
    [contentLayout addSubview:layout];
    NSArray *imgArray = @[@"comments",@"form",@"favorite",@"gifts",@"favorites",@"dollar",@"video",@"more"];
    NSArray *titleArray = @[@"消息",@"上传简历",@"收藏文章",@"我的道具",@"关注公司",@"钱包",@"我的视频",@"更多",];
    
    for (int i = 0; i<imgArray.count; i++) {
        MyLinearLayout *itemLayout = [self createCenterLayoutButtonWithImgName:imgArray[i] withTitle:titleArray[i]];
        itemLayout.backgroundColor = [UIColor whiteColor];
        [layout addSubview:itemLayout];
        
        MyBorderline *line = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
        if (i/4==0) {
            itemLayout.bottomBorderline = line;
        }
        if (i+1%4 != 0 ) {
            itemLayout.rightBorderline = line;
        }
    }
    
    
}

-(void)addFooterLayout:(MyLinearLayout*)contentLayout
{
    MyLinearLayout *passwordLayout = [self createFooterLayoutButtonWithImgName:@"password" withTitle:@"隐私设置"];
    passwordLayout.myTop = 20;
    passwordLayout.backgroundColor = [UIColor whiteColor];
    [contentLayout addSubview:passwordLayout];
    
    MyBorderline *line = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
    line.headIndent = 50;
    passwordLayout.bottomBorderline = line;
    
    MyLinearLayout *remindLayout = [self createFooterLayoutButtonWithImgName:@"remind" withTitle:@"通知"];
    remindLayout.backgroundColor = [UIColor whiteColor];
    [contentLayout addSubview:remindLayout];
}

#pragma mark -- 创建单个按钮

-(MyLinearLayout*)createFooterButtonLayoutWithNumber:(int)number withTitle:(NSString*)title
{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.gravity =  MyGravity_Horz_Center;
    
    UILabel *numberLable = [UILabel new];
    numberLable.text = [NSString stringWithFormat:@"%d",number];
    numberLable.font = [JHTool weightFont:16];
    [numberLable sizeToFit];
    [layout addSubview:numberLable];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = [JHTool font:15];
    titleLabel.textColor = [UIColor lightGrayColor];
    [titleLabel sizeToFit];
   
    [layout addSubview:titleLabel];
    
    return layout;
}

-(MyLinearLayout *)createCenterLayoutButtonWithImgName:(NSString *)imgName withTitle:(NSString*)title
{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    layout.gravity = MyGravity_Center;
   
    layout.heightSize.equalTo(layout.widthSize);
    
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:imgName];
    imgView.mySize = CGSizeMake(20, 20);
    [layout addSubview:imgView];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = [JHTool font:13];
    [titleLabel sizeToFit];
     titleLabel.myTop = 10;
    [layout addSubview:titleLabel];
    
    return layout;
}


-(MyLinearLayout *)createFooterLayoutButtonWithImgName:(NSString *)imgName withTitle:(NSString *)title
{
    MyLinearLayout *layout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    layout.wrapContentHeight = true;
    layout.padding = UIEdgeInsetsMake(10, 20, 10, 20);
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:imgName];
    imgView.mySize = CGSizeMake(25, 25);
    [layout addSubview:imgView];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = [JHTool font:14];
    [titleLabel sizeToFit];
    titleLabel.myLeft = 10;
    titleLabel.myCenterY = 0;
    titleLabel.myTrailing = 0.5;
    [layout addSubview:titleLabel];
    
    UIImageView *nextIcon = [UIImageView new];
    nextIcon.image = [UIImage imageNamed:@"nextIcon"];
    nextIcon.mySize = CGSizeMake(20, 20);
    nextIcon.myCenterY = 0;
    nextIcon.myLeading = 0.5;
    [layout addSubview:nextIcon];
    
    return layout;
    
}
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//
//    //获取导航栏的背景图片
//    _navImageView = self.navigationController.navigationBar.subviews.firstObject;
//        CGFloat minAlphaOffset = 0;
//        CGFloat maxAlphaOffset = 100;
//        CGFloat offset = scrollView.contentOffset.y;
//        CGFloat alpha = (offset - minAlphaOffset)/(maxAlphaOffset - minAlphaOffset);
//
//    if (scrollView.contentOffset.y < 5) {
//       [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//         self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[[UIColor whiteColor] colorWithAlphaComponent:0]};
//    }else
//    {
//        [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor: [[JHTool thisAppTintColor]colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
//          self.navigationItem.title = @"蓝色土耳其";
//        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[[UIColor whiteColor] colorWithAlphaComponent:alpha]};
//    }
//
//
//
//   }


-(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contex = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(contex, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
 
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

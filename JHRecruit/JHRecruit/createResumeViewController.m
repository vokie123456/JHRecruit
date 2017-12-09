//
//  createResumeViewController.m
//  JHRecruit
//
//  Created by milan on 2017/8/6.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "createResumeViewController.h"
#import "informationInputViewController.h"
#import "JHPickerView.h"
#import "RootViewController.h"
#import "UserManager.h"
#import "SVProgressHUD.h"

@interface createResumeViewController ()<InformationDelegate>

@property (nonatomic , strong) UILabel *nameLabel;
@property (nonatomic , strong) UILabel *sexLabel;
@property (nonatomic , strong) UILabel *educationLabel;
@property (nonatomic , strong) UILabel *targetLabel;
@property (nonatomic , strong) UILabel *birthdayLabel;
@property (nonatomic , strong) UILabel *schoolLabel;
@property (nonatomic , strong) UILabel *workLabel;
@property (nonatomic , strong) UILabel *wageLabel;



@end

@implementation createResumeViewController
-(void)loadView{
    [super loadView];
    
    MyLinearLayout *rootView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    rootView.myMargin = 0;
    rootView.gravity = MyGravity_Horz_Fill;
    rootView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:rootView];
    self.rootView = rootView;
    
    NSArray *titleArray = @[@"姓名",@"性别",@"学历",@"求职意向",@"出生日期",@"毕业院校",@"工作经验",@"预期工资"];
    _nameLabel = [UILabel new];
    _sexLabel = [UILabel new];
    _educationLabel = [UILabel new];
    _targetLabel = [UILabel new];
    _birthdayLabel = [UILabel new];
    _schoolLabel = [UILabel new];
    _workLabel = [UILabel new];
    _wageLabel = [UILabel new];
    NSArray *labelArray = @[_nameLabel,_sexLabel,_educationLabel,_targetLabel,_birthdayLabel,_schoolLabel,_workLabel,_wageLabel];
    for (int i = 0; i<titleArray.count; i++) {
        MyLinearLayout *layout = [self createInfoLineWithTitle:titleArray[i] withLabel:labelArray[i]];
        layout.tag = i;
        [layout setTarget:self action:@selector(layoutClickAction:)];
        [rootView addSubview:layout];
    }
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    

}

-(MyLinearLayout*)createInfoLineWithTitle:(NSString *)title withLabel:(UILabel*)label{
    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    contentLayout.myHeight = 40;
    contentLayout.backgroundColor = [UIColor whiteColor];
    contentLayout.gravity = MyGravity_Vert_Center;
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = title;
    titleLabel.font = [JHTool font:16];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.myLeft = 10;
    titleLabel.myRight = 0.5;
    [titleLabel sizeToFit];
    [contentLayout addSubview:titleLabel];
    
   
    label.font = [JHTool font:16];
    label.textColor = [UIColor lightGrayColor];
    label.myLeft = 0.5;
    label.wrapContentSize = true;
    [contentLayout addSubview:label];

    
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"nextIcon_Hl"];
    imgView.myLeft = 10;
    imgView.myRight = 10;
    imgView.mySize = CGSizeMake(20, 20);
    [contentLayout addSubview:imgView];
    
    MyBorderline *line = [[MyBorderline alloc]initWithColor:[UIColor lightGrayColor]];
    line.headIndent = 10;
    contentLayout.bottomBorderline = line;
    
    return contentLayout;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"跳过" style:UIBarButtonItemStylePlain target:self action:@selector(navBarItemAction:)];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(navBarItemAction:)];
    
    leftItem.tintColor = [UIColor whiteColor];
    rightItem.tintColor = [UIColor whiteColor];
    leftItem.tag = 0;
    rightItem.tag = 1;
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
   }
-(void)navBarItemAction:(UIBarButtonItem*)item{
//    if (item.tag == 0) {
//        
//        UIWindow *window = [[UIApplication sharedApplication]keyWindow];
//        UINavigationController *oldNav = (UINavigationController *)window.rootViewController;
//        
//        RootViewController *root = [[RootViewController alloc]init];
//        [[UIApplication sharedApplication]keyWindow].rootViewController = root;
//        oldNav.viewControllers = [NSArray new];
//        oldNav = nil;
//        
//        
//    }else{
//        self.view.userInteractionEnabled = false;
//        [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//        [SVProgressHUD showWithStatus:@"Loading"];
//        NSString *account = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
//
//        NSDictionary *infoDic = @{@"userName":account,@"name":_nameLabel.text,@"education":_educationLabel.text,@"target":_targetLabel.text,@"experience":_workLabel.text,@"wage":_wageLabel.text};
//        UserManager *manger = [UserManager shareManager];
//        [manger updateUserResumeWithDic:infoDic success:^{
//            [SVProgressHUD dismiss];
//            UIWindow *window = [[UIApplication sharedApplication]keyWindow];
//            UINavigationController *oldNav = (UINavigationController *)window.rootViewController;
//            
//            RootViewController *root = [[RootViewController alloc]init];
//            [[UIApplication sharedApplication]keyWindow].rootViewController = root;
//            oldNav.viewControllers = [NSArray new];
//            oldNav = nil;            
//            
//        } fail:^{
//            [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
//            [SVProgressHUD showErrorWithStatus:@"网络错误"];
//            [SVProgressHUD dismissWithDelay:1 completion:^{
//                self.view.userInteractionEnabled = true;
//            }];
//        }];
//        
//        
//        
//    }
    
    
    UIWindow *window = [[UIApplication sharedApplication]keyWindow];
    UINavigationController *oldNav = (UINavigationController *)window.rootViewController;
    
    RootViewController *root = [[RootViewController alloc]init];
    [[UIApplication sharedApplication]keyWindow].rootViewController = root;
    oldNav.viewControllers = [NSArray new];
    oldNav = nil;

}


-(void)layoutClickAction:(MyLinearLayout *)layout{
    
    NSUInteger tag = layout.tag;
    if (tag == 0 || tag ==3 || tag == 5) {
        informationInputViewController *info = [[informationInputViewController alloc]init];
        info.layoutTag = tag;
         info.delegate = self;
        switch (tag) {
            case 0:
                info.maxLength = 4;
                break;
            case 3:
                info.maxLength = 10;
                break;
            case 5:
                info.maxLength = 20;
                break;
            default:
                break;
        }
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:info];
        [self presentViewController:nav animated:true completion:nil];
        
    }else{
    
        switch (tag) {
            case 1:
                [self selectSexAlertView];
                break;
            case 2:
                [self seletEducationPrickerView];
                break;
           case 4:
                [self selectBirthdayPickerView];
                break;
            case 6:
                [self selectTheYearOfWorking];
                break;
            case 7:
                [self selectExpectedWage];
                break;
            default:
                break;
        }
    }
    
   
    
    
   
    
}
#pragma mark - informationInputDelegate
-(void)changeValue:(NSString *)content withTag:(NSUInteger)tag{
    switch (tag) {
        case 0:
            _nameLabel.text = content;
            break;
        case 3:
            self.targetLabel.text = content;
            break;
        case 5:
            self.schoolLabel.text = content;
            break;
        default:
            break;
    }

}
#pragma mark -- 选择器
-(void)selectSexAlertView{
   
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *maleAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.sexLabel.text = @"男";
    }];
    
    UIAlertAction *femaleAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         self.sexLabel.text = @"女";
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction:maleAction];
    [alertController addAction:femaleAction];
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:true completion:nil];
    
}

-(void)seletEducationPrickerView{
    NSString *plistUrl = [[NSBundle mainBundle] pathForResource:@"educationList" ofType:@"plist"];
    NSArray *educationArray = [[NSArray alloc]initWithContentsOfFile:plistUrl];
    JHPickerView *pick = [JHPickerView showJHPickerViewToView:self.view titleArray:nil contentArray:educationArray confirmBlock:^(NSArray *contentArray) {
        self.educationLabel.text = contentArray[0];
    } cancelBlock:nil];
    [pick.pickerView selectRow:2 inComponent:0 animated:false];

}
-(void)selectBirthdayPickerView{
    NSString *plistUrl = [[NSBundle mainBundle] pathForResource:@"birthdayList" ofType:@"plist"];
    NSArray *birthdayArray = [[NSArray alloc]initWithContentsOfFile:plistUrl];
    JHPickerView *pick = [JHPickerView showJHPickerViewToView:self.view titleArray:birthdayArray[0] contentArray:birthdayArray[1] confirmBlock:^(NSArray *contentArray) {
        self.birthdayLabel.text = [NSString stringWithFormat:@"%@-%@",contentArray[0],contentArray[1]];
    } cancelBlock:nil];
    [pick.pickerView selectRow:35 inComponent:0 animated:false];
  
    
}

-(void)selectTheYearOfWorking{
    
    NSString *plistUrl = [[NSBundle mainBundle] pathForResource:@"workExperience" ofType:@"plist"];
    NSArray *workYearArray = [[NSArray alloc]initWithContentsOfFile:plistUrl];
    JHPickerView *pick = [JHPickerView showJHPickerViewToView:self.view titleArray:nil contentArray:workYearArray confirmBlock:^(NSArray *contentArray) {
    
        self.workLabel.text = contentArray.firstObject;
       
        
        
    } cancelBlock:nil];
    
    
    
    [pick.pickerView selectRow:2 inComponent:0 animated:false];

}
-(void)selectExpectedWage{
    NSString *plistUrl = [[NSBundle mainBundle]pathForResource:@"expertedWage" ofType:@"plist"];
    NSArray *wageArray = [[NSArray alloc]initWithContentsOfFile:plistUrl];
    
    [JHPickerView showJHPickerViewToView:self.view titleArray:nil contentArray:wageArray confirmBlock:^(NSArray *contentArray) {
        self.wageLabel.text = contentArray.firstObject;
    } cancelBlock:nil];
    
}

@end

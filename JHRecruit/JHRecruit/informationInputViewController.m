//
//  informationInputViewController.m
//  JHRecruit
//
//  Created by milan on 2017/8/7.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "informationInputViewController.h"

@interface informationInputViewController ()

@end

@implementation informationInputViewController
-(void)loadView{
    [super loadView];
    MyLinearLayout *rootView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    rootView.backgroundColor = [JHTool thisAppBackgroundColor];
    rootView.myMargin = 0;
    [rootView setTarget:self action:@selector(hideKeyBoard)];
    [self.view addSubview:rootView];
    self.rootView = rootView;
    
    
    UITextField *textField = [[UITextField alloc]init];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.myHorzMargin = 0;
    textField.myTop = 30;
    textField.myHeight = 40;
    textField.backgroundColor = [UIColor whiteColor];
    [textField addTarget:self action:@selector(textFieldValueChange:) forControlEvents:UIControlEventEditingChanged];
    [rootView addSubview:textField];
    self.textField  = textField;
    
    UILabel *fontCount = [UILabel new];
    fontCount.text = [NSString stringWithFormat:@"0/%d",self.maxLength];
    fontCount.font = [JHTool font:14];
    fontCount.textColor = [JHTool thisAppTintColor];
    fontCount.myTop = 20;
    fontCount.myLeft = 0.9;
    fontCount.wrapContentSize = true;
    [rootView addSubview:fontCount];
    self.fontCount = fontCount;
    
    
    
    
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavBar];
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [JHTool thisAppTintColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
}

#pragma mark -- 监听输入，限制字符数

-(void)textFieldValueChange:(UITextField*)textField{
    NSString *toString = textField.text;
    /*中文输入中，拼音输入，或者五笔输入会有字符高亮，将会超出最大节数限制，
     所以需要检测是否在输入状态中，对没有高亮状态的text进行检测
     */
    
    //获取高亮部分
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    if (!position || !selectedRange) {
       
        
        if (toString.length>self.maxLength) {
            NSRange rangeIndex = [toString rangeOfComposedCharacterSequenceAtIndex:self.maxLength];
            if (rangeIndex.length == 1) {
                textField.text = [toString substringToIndex:self.maxLength];
            }else{
                NSRange rangeRange = [toString rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, self.maxLength)];
                textField.text = [toString substringWithRange:rangeRange];
            }
        }
        self.currentLength = (int)textField.text.length;
        
    }
}

-(void)setCurrentLength:(int)currentLength{
  

    _fontCount.text = [NSString stringWithFormat:@"%d/%d",currentLength,self.maxLength];
}
-(void)hideKeyBoard{
    [self.view endEditing:true];
}

-(void)setNavBar{
    self.title = @"填写信息";
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(ItemAction:)];
    leftItem.tintColor = [UIColor whiteColor];
    leftItem.tag = 0;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(ItemAction:)];
    rightItem.tag = 1;
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
   
}
-(void)ItemAction:(UIBarButtonItem *)item{
     [self.view endEditing:true];
    
    switch (item.tag) {
        case 0:
             [self dismissViewControllerAnimated:true completion:nil];
            break;
        case 1:
            [self.delegate changeValue:self.textField.text withTag:self.layoutTag];
            [self dismissViewControllerAnimated:true completion:nil];
            break;
        default:
            break;
    }
   
}

@end

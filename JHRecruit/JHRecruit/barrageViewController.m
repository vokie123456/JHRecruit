//
//  barrageViewController.m
//  JHRecruit
//
//  Created by milan on 2017/8/1.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "barrageViewController.h"
#import "barrageTableViewCell.h"
#import "barrageModel.h"
@interface barrageViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@end

@implementation barrageViewController
-(void)loadView{
    
    [super loadView];
    MyFrameLayout *frameLayout = [[MyFrameLayout alloc]init];
//    frameLayout.myMargin = 0;
//    [frameLayout setTarget:self action:@selector(hideKeyBoard)];
//    [self.view addSubview:frameLayout];
    self.view = frameLayout;
    
    MyLinearLayout *toolView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    toolView.wrapContentHeight = true;
    toolView.myHorzMargin = 0;
    toolView.myBottom = 10;
    [frameLayout addSubview:toolView];
    
    UIButton *barrageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [barrageBtn setBackgroundImage:[UIImage imageNamed:@"barrageIcon"] forState:UIControlStateNormal];
    barrageBtn.myLeft = 20;
    barrageBtn.mySize = CGSizeMake(40, 40);
    [toolView addSubview:barrageBtn];
    
    UIButton *cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraBtn setBackgroundImage:[UIImage imageNamed:@"cameraIcon"] forState:UIControlStateNormal];
    cameraBtn.myLeft = 10;
    cameraBtn.mySize = CGSizeMake(40, 40);
    [toolView addSubview:cameraBtn];
    
    UIButton *beautyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [beautyBtn setBackgroundImage:[UIImage imageNamed:@"beautyIcon"] forState:UIControlStateNormal];
    beautyBtn.myLeft = 10;
    beautyBtn.mySize = CGSizeMake(40, 40);
    [toolView addSubview:beautyBtn];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setBackgroundImage:[UIImage imageNamed:@"downIcon"] forState:UIControlStateNormal];
    closeBtn.myLeft = 0.99;
    closeBtn.myRight = 20;
    closeBtn.mySize = CGSizeMake(40, 40);
    [toolView addSubview:closeBtn];
    
    barrageBtn.tag = 101;
    [barrageBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    
    cameraBtn.tag = 102;
    [cameraBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    
    beautyBtn.tag = 103;
    [beautyBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    
    closeBtn.tag = 104;
    [closeBtn addTarget:self action:@selector(buttonDelegate:) forControlEvents:UIControlEventTouchUpInside];
    
    
    /*弹幕列表
     */
    
    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.showsVerticalScrollIndicator = false;
    tableView.myBottom = 100;
    tableView.myLeft = 20;
    tableView.myRight = 0.4;
    tableView.myTop = 0.6;
    [frameLayout addSubview:tableView];
    tableView.estimatedRowHeight = 40;
    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.backgroundColor = [UIColor clearColor];
    [tableView registerClass:[barrageTableViewCell class] forCellReuseIdentifier:NSStringFromClass([barrageTableViewCell class])];
    self.tabelView = tableView;
    
    
    MyLinearLayout *inputView = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Horz];
    inputView.wrapContentHeight = true;
    inputView.myHorzMargin = 0;
    inputView.myBottom = 0;
    inputView.padding = UIEdgeInsetsMake(5, 10, 5, 10);
    inputView.backgroundColor = [UIColor whiteColor];
    self.inputView = inputView;
    
    
    UITextField *textField = [[UITextField alloc]init];
    textField.myHeight = 40;
    textField.weight = 1;
    textField.myRight = 10;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.delegate = self;
    textField.returnKeyType = UIReturnKeySend;
    [inputView addSubview:textField];
    self.textField = textField;
    
//    UIButton *sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [sendBtn setTitle:@"发送" forState:UIControlStateNormal];
//    sendBtn.backgroundColor = [JHTool thisAppTintColor];
//    sendBtn.myTrailing = 10;
//    sendBtn.mySize = CGSizeMake(40, 20);
//    [inputView addSubview:sendBtn];
//    [sendBtn addTarget:self action:@selector(sendComment) forControlEvents:UIControlEventTouchUpInside];
    
    

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBorderFrameChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self.socketClient on:@"comment" callback:^(NSArray * data, SocketAckEmitter * ack) {
        NSDictionary *dic = data[0];
        barrageModel *model = [[barrageModel alloc]init];
        model.uid = dic[@"uid"];
        model.comment = dic[@"text"];
        [self.dataArray addObject:model];
        [self.tabelView reloadData];
        
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [self.tabelView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionBottom animated:true];
        
        
    }];
    
    
   }


-(void)hideKeyBoard{
    [self.view endEditing:true];
    
   }

-(void)showTheInputView{
    
    [self.toolView removeFromSuperview];
    [self.view addSubview:self.inputView];
    [self.textField becomeFirstResponder];
    
    
}

-(void)keyBorderFrameChange:(NSNotification *)notification{
    NSDictionary *dic = notification.userInfo;
    CGRect frame = [dic[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height = frame.size.height;
    
    if (frame.origin.y == VIEW_HEIGHT) {
        
       
            self.view.frame = CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEIGHT);
       
    }else if (frame.origin.y == VIEW_HEIGHT - height){
        self.view.frame = CGRectMake(0, -height, VIEW_WIDTH, VIEW_HEIGHT);
    }

}
#pragma mark -- 点击按钮触发代理方法
-(void)buttonDelegate:(UIButton *)btn{
    switch (btn.tag) {
        case 101:
            [self showTheInputView];
            break;
        case 102:
            [self.delegate changeCameraDirection];
            break;
        case 103:
            [self.delegate showBeautyView];
            break;
        case 104:
            [self.delegate closeControllerAndStopLive];
            break;
        default:
            break;
    }
    
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    [self.inputView removeFromSuperview];
    [self.view addSubview:self.toolView];
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if ([string isEqualToString:@"\n"]) {
        if (![textField.text  isEqual: @""]) {
             [self.socketClient emit:@"comment" with:@[@{@"roomKey":@"1234",@"text":textField.text,@"uid":@"糜烂的东西"}]];
        }
        textField.text = @"";
        return false;
    }
      return true;
    
}

//-(BOOL)textFieldShouldReturn:(UITextField *)textField{
//    if ([textField.text  isEqual: @""]) {
//        return false;
//    }else{
//        return true;
//    }
//}

#pragma mark - tableView代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    barrageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([barrageTableViewCell class]) forIndexPath:indexPath];
    
    cell.model = self.dataArray[indexPath.row];
    
    return cell;
    
}


@end

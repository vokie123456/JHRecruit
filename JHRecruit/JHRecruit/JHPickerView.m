//
//  JHPickerView.m
//  JHPickerView
//
//  Created by milan on 2017/8/8.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "JHPickerView.h"

@interface JHPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>


@property (nonatomic , strong) UIButton *cancelBtn;
@property (nonatomic , strong) UIButton *confirmBtn;
@property (nonatomic , strong) NSArray *contentArray;
@property (nonatomic , strong) NSArray *titleArray;
@property (nonatomic , strong) confirmBlock confirmBlock;
@property (nonatomic , strong) cancleBlock cancelBlock;
@property (nonatomic , strong) NSArray *sendArray;

@end

@implementation JHPickerView
const int contentViewHeight = 300;
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
       
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGestureAction)];
        
        [self addGestureRecognizer:tapGesture];
        [self setLayout];
        
    }
    return self;
}


+(JHPickerView*)showJHPickerViewToView:(UIView *)view titleArray:(NSArray *)titleArray contentArray:(NSArray *)contentArray confirmBlock:(confirmBlock)confirmBlock cancelBlock:(cancleBlock)cancleBlock{
    
    
    
    JHPickerView *myPickerView = [[JHPickerView alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, view.frame.size.height)];
    myPickerView.confirmBlock = confirmBlock;
    myPickerView.cancelBlock = cancleBlock;
    
    myPickerView.alpha = 0.0;
    myPickerView.contentArray = contentArray;
    myPickerView.titleArray = titleArray;
    [view addSubview:myPickerView];
    [UIView animateWithDuration:0.38 animations:^{
        myPickerView.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - contentViewHeight, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
        myPickerView.alpha = 1.0;
        
    }];
    
    return myPickerView;
    

}

-(void)setLayout{
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor whiteColor];
    contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
    [self addSubview:contentView];
    self.contentView = contentView;
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    cancelBtn.frame = CGRectMake(10, 10, 60, 40);
    [cancelBtn setTitleColor:[UIColor colorWithRed:0 green:234/255.0 blue:212/255.0 alpha:1] forState:UIControlStateNormal];
    cancelBtn.backgroundColor  = [UIColor whiteColor];
    cancelBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cancelBtn.layer.borderWidth = 0.5;
    cancelBtn.layer.cornerRadius = 20;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:cancelBtn];
    self.cancelBtn = cancelBtn;
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    confirmBtn.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-70, 10, 60, 40);
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmBtn.backgroundColor  = [UIColor colorWithRed:0 green:234/255.0 blue:212/255.0 alpha:1];
    confirmBtn.layer.cornerRadius = 20;
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:confirmBtn];
    self.confirmBtn = confirmBtn;
    
    UIView *line = [UIView new];
    line.backgroundColor = [UIColor lightGrayColor];
    line.frame =CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, 0.5);
    [self.contentView addSubview:line];
    
    UIPickerView *pickerView = [[UIPickerView alloc]init];
    pickerView.delegate = self;
    pickerView.dataSource = self;
    pickerView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*0.1, 60, [UIScreen mainScreen].bounds.size.width*0.8, contentViewHeight-70);
    [self.contentView addSubview:pickerView];
    self.pickerView = pickerView;
    
    [self.cancelBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
     [self.confirmBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self.cancelBtn.tag = 0;
    self.confirmBtn.tag = 1;
    
    
    
}

-(void)buttonAction:(UIButton*)button{
    
    if (button.tag == 0 && _cancelBlock) {
            self.cancelBlock();
     
       
    }else if (button.tag == 1 && _confirmBlock){
       
        
        if (_titleArray) {
            NSString *str1 = self.titleArray[[self.pickerView selectedRowInComponent:0]];
            NSString *str2 = self.contentArray[[self.pickerView selectedRowInComponent:1]];
            self.confirmBlock(@[str1,str2]);
            
            
        }else{
            NSString *str = self.contentArray[[self.pickerView selectedRowInComponent:0]];
            self.confirmBlock(@[str]);
        }
        
        
    }
     [self tapGestureAction];

}


-(void)tapGestureAction{
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, contentViewHeight);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    

}
#pragma mark - UIPickerViewDelegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    if (_titleArray) {
        return 2;
    }else{
        return 1;
    }
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
     NSInteger result = 0;
    if (_titleArray) {
        switch (component) {
            case 0:
                result = self.titleArray.count;
                break;
            case 1:
                result = self.contentArray.count;

                break;
            default:
                break;
        }
    }else{
        result = self.contentArray.count;
    }
    
    return result;
}
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    
    for (UIView *speartorView in pickerView.subviews) {
        if (speartorView.frame.size.height < 1) {
            speartorView.backgroundColor = [UIColor lightGrayColor];
        }
    }
    
    NSString *str = @"";
    
    UILabel *contentLabel = [UILabel new];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.textColor = [UIColor blackColor];
    contentLabel.font = [UIFont systemFontOfSize:20];
    
    if (_titleArray) {
        switch (component) {
            case 0:
                str = self.titleArray[row];
                break;
             case 1:
                str = self.contentArray[row];
                break;
            default:
                break;
        }
    }else{
        str = self.contentArray[row];
    }
    
    contentLabel.text = str;
    
    return contentLabel;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 44;
}



@end

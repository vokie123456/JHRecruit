//
//  interViewQuestionController.m
//  JHRecruit
//
//  Created by milan on 2017/9/16.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "interViewQuestionController.h"
#import "CountdownView.h"


@interface interViewQuestionController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UILabel *questionLabel;
@property(nonatomic,strong)UIImagePickerController *imagePicker;

@end

@implementation interViewQuestionController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"面试题目";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = false;
    
    
    
    CGRect textSize = [_questionContent boundingRectWithSize:CGSizeMake(self.view.frame.size.width-30, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil];
    
    
    _questionLabel = [UILabel new];
    _questionLabel.frame = CGRectMake(20, 40, textSize.size.width, textSize.size.height);
    _questionLabel.text = _questionContent;
    _questionLabel.numberOfLines = 0;
    _questionLabel.lineBreakMode = NSLineBreakByWordWrapping;
    _questionLabel.font = [UIFont systemFontOfSize:18];
    _questionLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:_questionLabel];
    
    UIButton *startInterViewBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    startInterViewBtn.backgroundColor = [JHTool thisAppTintColor];
    [startInterViewBtn setTitle:@"开始" forState:UIControlStateNormal];
    startInterViewBtn.frame = CGRectMake(self.view.frame.size.width/2-30, self.view.frame.size.height-200, 60, 60);
    startInterViewBtn.layer.cornerRadius = 30;
    [startInterViewBtn addTarget:self action:@selector(startInterView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startInterViewBtn];
    
    _imagePicker = [[UIImagePickerController alloc]init];
    
    
}
-(void)cancleInterView{
    
    [self dismissViewControllerAnimated:true completion:nil];
}
-(void)startInterView{
//    CountdownView *countView = [[CountdownView alloc]initWithSeconds:3 animationFinish:nil];
//    countView.roundColor = [JHTool thisAppTintColor];
//    countView.backgroundColor = [UIColor lightGrayColor];
//    [[[UIApplication sharedApplication]keyWindow] addSubview:countView];
    
    [self checkAvailableAndSetImagePicker];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//检测设备是否可用
-(void)checkAvailableAndSetImagePicker{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"相机不可用!" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alertController animated:true completion:nil];
        return;
    }
    
    _imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _imagePicker.videoQuality = UIImagePickerControllerQualityTypeMedium;
    _imagePicker.mediaTypes = @[(NSString*)kUTTypeMovie];
    _imagePicker.delegate = self;
    [self presentViewController:_imagePicker animated:true completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"%@",info[UIImagePickerControllerMediaURL]);
    [_imagePicker dismissViewControllerAnimated:true completion:nil];
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
     [_imagePicker dismissViewControllerAnimated:true completion:nil];
}


@end

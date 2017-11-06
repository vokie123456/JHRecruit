//
//  DetailsArticalController.m
//  JHRecruit
//
//  Created by milan on 2017/10/26.
//  Copyright © 2017年 milan. All rights reserved.
//

#import "DetailsArticalController.h"
#import "HtmlModel.h"
#import "SVProgressHUD.h"
#import "BAButton.h"
#import "CommentViewController.h"


@interface DetailsArticalController ()<UIWebViewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)UIWebView *webView;


@end

@implementation DetailsArticalController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [UIWebView new];
    _webView.delegate = self;
    _webView.scrollView.delegate = self;
    _webView.backgroundColor = [UIColor whiteColor];
    self.view = _webView;
    
    [_webView loadHTMLString:[HtmlModel getHtmlString] baseURL:nil];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    [[UIToolbar appearance] setBackgroundColor:[UIColor whiteColor]];
    
    UIBarButtonItem *agreeItem = [self createBarButtonItemWithImgName:@"agreeIcon" title:@"赞同" selectedImgName:@"agreeIcon_hl"  Tag:101];
    
    UIBarButtonItem *collectItem = [self createBarButtonItemWithImgName:@"collectIcon" title:@"收藏" selectedImgName:@"collectIcon_hl"  Tag:102];
    
    UIBarButtonItem *commentItem = [self createBarButtonItemWithImgName:@"commentIcon" title:@"评论" selectedImgName:nil Tag:103];
    
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    spaceItem.width = 100;
    
    self.toolbarItems = @[agreeItem,spaceItem,collectItem,spaceItem,commentItem];
    
   
    
}
-(void)viewWillAppear:(BOOL)animated{
   
    [self.navigationController setToolbarHidden:false animated:true];
}
-(void)viewWillDisappear:(BOOL)animated{
   [self.navigationController setToolbarHidden:true animated:true];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //判断是否第一次加载
    NSString *url = request.URL.absoluteString;
    if ([url isEqualToString:@"about:blank"]) {
        return true;
    }
    return false;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [SVProgressHUD dismiss];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    if (velocity.y>0) {
        [self.navigationController setToolbarHidden:true animated:true];
    }else{
         [self.navigationController setToolbarHidden:false animated:true];
    }
}
-(void)barButtonItemClickAction:(UIButton*)item{
    if (item.tag == 103) {
        CommentViewController *comment = [CommentViewController new];
        [self.navigationController pushViewController:comment animated:true];
        
        return;
    }
     item.selected = !item.selected;
    if (item.tag == 102) {
        if (item.selected) {
            [SVProgressHUD showSuccessWithStatus:[NSString stringWithFormat:@"已%@",item.currentTitle]];
            [SVProgressHUD dismissWithDelay:1];
        }
    }
    
}
-(UIBarButtonItem*)createBarButtonItemWithImgName:(NSString *)imgName title:(NSString*)title selectedImgName:(NSString*)selectedImgName  Tag:(NSUInteger)tag {
  
    
    UIButton *itemBtn = [UIButton ba_buttonWithFrame:CGRectMake(0, 0, 50, 50) title:title titleColor:[UIColor lightGrayColor] titleFont:nil image:[UIImage imageNamed:imgName] backgroundColor:nil];
    itemBtn.titleLabel.font = [JHTool font:12];
    itemBtn.tag = tag;
    [itemBtn ba_button_setButtonLayoutType:BAKit_ButtonLayoutTypeCenterImageTop padding:0];
    [itemBtn addTarget:self action:@selector(barButtonItemClickAction:) forControlEvents:UIControlEventTouchUpInside];
    if (selectedImgName!=nil) {
        [itemBtn setImage:[UIImage imageNamed:selectedImgName] forState:UIControlStateSelected];
        //[itemBtn setTitle:selectedTitle forState:UIControlStateSelected];
        [itemBtn setTitleColor:[JHTool thisAppTintColor] forState:UIControlStateSelected];
    }
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    
    
    return item;
    
}


@end

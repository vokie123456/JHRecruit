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


@interface DetailsArticalController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView *webView;


@end

@implementation DetailsArticalController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [UIWebView new];
    _webView.backgroundColor = [JHTool thisAppBackgroundColor];
    _webView.delegate = self;
    self.view = _webView;
    
    [_webView loadHTMLString:[HtmlModel getHtmlString] baseURL:nil];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
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


@end

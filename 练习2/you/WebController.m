//
//  WebController.m
//  you
//
//  Created by 优途 on 15-3-4.
//  Copyright (c) 2015年 YuanDaYouTu. All rights reserved.
//

#import "WebController.h"

@interface WebController ()<UIWebViewDelegate>
{
    UIWebView *_webView ;
}
@end

@implementation WebController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavBarleftBtn:@"back" andlDimg:nil rightBtn:nil andrImg:nil title:_titleStr];
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHTS, self.view.width, self.view.height-NAVBAR_HEIGHTS)];
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
//    _webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    _webView.autoresizesSubviews = NO; //自动调整大小
    _webView.autoresizingMask=(UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth);
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:_urlStr]];
    [self.view addSubview: _webView];
    //192.168.1.234
    //116.255.209.38:8080
    [_webView loadRequest:request];
    
    

}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"开始加载");
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"完成加载");
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"开始加载%@",error);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

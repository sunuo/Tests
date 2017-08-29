//
//  KVWebViewController.m
//  SNTests
//
//  Created by xukaitiankevin on 2017/1/9.
//  Copyright © 2017年 徐诺. All rights reserved.
//

#import "KVWebViewController.h"
static void* ccccontext = &ccccontext;
@interface KVWebViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView* web;
@end

@implementation KVWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    UIImageView* imageView =[[UIImageView alloc] initWithFrame:self.view.bounds];
    [imageView setContentMode:UIViewContentModeScaleAspectFill];
    [imageView setImage:[UIImage imageNamed:@"bcg.jpg"]];
    [self.view addSubview:imageView];
//
    [self.view setBackgroundColor:[UIColor redColor]];
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 64;
    UIWebView* webview = [[UIWebView alloc] initWithFrame:rect];
//    [webview loadHTMLString:@"<!DOCTYPE HTML>\
//    <html>\
//    <body>\
//    <p>fsdfasdfasdf\
//    <img src=\"http://img2.ph.126.net/wE6-IE15OzTzKUzy3X5izA==/2212956266999766098.png\" width=\"284\" height=\"300\" />\
//    </p>\
//    </body>\
//    </html>" baseURL:nil];

    self.automaticallyAdjustsScrollViewInsets = YES;
    [webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.baidu.com"]]];
    
    webview.opaque = NO;
    [webview setBackgroundColor:[UIColor clearColor]];
    self.web = webview;
    self.web.delegate = self;
    [self.view addSubview:webview];
    
//    [self request];
}


-(void)request
{
    [self performSelector:@selector(request) withObject:nil afterDelay:0.1];
    NSLog(@"request");
    
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://gaoxueya.gorgonor.com/h5/hyperMeeting/voteDoctor?group=1&doctor=yes"]];
    [request setHTTPMethod:@"POST"];
    
    
    [self.web loadRequest:request];
    
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    NSLog(@"request statrt");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSHTTPCookieStorage* cookie = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray* array = cookie.cookies;
    NSLog(@"request finish");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if (context == ccccontext) {
//        NSLog(@"%@",change);
//    } else {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

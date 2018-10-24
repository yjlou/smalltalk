//
//  ViewController.m
//  shhh
//
//  Created by kclin on 2018/10/22.
//  Copyright © 2018 kclin. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView.UIDelegate = self;
    _webView.navigationDelegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    
    NSString *urlString = @"https://go.kclin.tw/";
    
    NSLog(@"viewDidLoad ============ ");
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:urlRequest];
    

}


- (void)appDidBecomeActive:(NSNotification *)notification {
    NSLog(@"did become active notification");
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    _open_url = appDelegate.app_url;
    appDelegate.app_url = NULL;
    NSLog(@"_open_url = ==================== %@", _open_url);
    
    if (_open_url) {
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@", _open_url]];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:urlRequest];
    }
    else {
        NSURL *url = [NSURL URLWithString:@"https://shhh.pw/"];
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        [_webView loadRequest:urlRequest];
    }
    
    
}

- (void)appWillEnterForeground:(NSNotification *)notification {
    NSLog(@"will enter foreground notification");
}



- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    
    NSLog(@"didStartProvisionalNavigation  **********************");
    
}



- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
    NSLog(@"didFinishNavigation  **********************");
    
}


- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    
    NSLog(@"didFailNavigation  **********************");
    
}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    
    //NSURLの取得
    NSURL *url= [webView URL];
    //NSURLRequestの取得
    NSURLRequest *req = [navigationAction request];
    NSString *dst_url = [[req URL] absoluteString];
    
    
    NSLog(@"data is ========================= %@", dst_url);
    
    
    // Intercept custom location change, URL begins with "js-call:"
    if ([dst_url hasPrefix:@"js-call--:"]) {
        
        // Extract the selector name from the URL
        NSArray *components = [dst_url componentsSeparatedByString:@"--:"];
        NSString *data = [components objectAtIndex:1];
        [UIPasteboard generalPasteboard].string = data;
        NSLog(@"data is ========================= %@", data);
        // Cancel the location change
        decisionHandler(WKNavigationActionPolicyCancel);
        
        return;
        
    }
    
    
    if(navigationAction.navigationType == WKNavigationTypeOther)
    {
        
        NSLog(@"WKNavigationTypeOther is =========================");
        if ([req URL] != NULL)
        {
            //do what you need with url
            //
            decisionHandler(WKNavigationActionPolicyAllow);
            return;
        }
        decisionHandler(WKNavigationActionPolicyCancel);
        return;
    }
    
    // Accept this location change
    decisionHandler(WKNavigationActionPolicyAllow);
    
    
    
}


/*
Below are UIWebView
 
 

 
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 NSLog(@"view will appear");
 }
 
 - (void)viewDidAppear:(BOOL)animated {
 [super viewDidAppear:animated];
 NSLog(@"view did appear");
 }
 
 
 - (void)webViewDidFinishLoad:(WKWebView *)webView
 {
 
 }
 
 
 
 // This function is called on all location change :
 - (BOOL)webView:(UIWebview *)webView2
 shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
 
 // Intercept custom location change, URL begins with "js-call:"
 if ([[[request URL] absoluteString] hasPrefix:@"js-call--:"]) {
 
 // Extract the selector name from the URL
 NSArray *components = [[[request URL] absoluteString] componentsSeparatedByString:@"--:"];
 NSString *data = [components objectAtIndex:1];
 [UIPasteboard generalPasteboard].string = data;
 NSLog(@"data is ========================= %@", data);
 // Cancel the location change
 return NO;
 }
 
 // Accept this location change
 return YES;
 
 }

 
 
 
 */



@end

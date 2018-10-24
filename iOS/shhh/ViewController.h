//
//  ViewController.h
//  shhh
//
//  Created by kclin on 2018/10/22.
//  Copyright © 2018 kclin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <WKNavigationDelegate, WKUIDelegate>


@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (strong, nonatomic) NSString *open_url;


@end


//
//  UIViewController+Extension.m
//  LZxcf
//
//  Created by app on 16/5/30.
//  Copyright © 2016年 win. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)pushWebViewWithURL:(NSString *)URL {
    UIViewController *viewCon = [[UIViewController alloc] init];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:viewCon.view.bounds];
    webView.backgroundColor = [UIColor redColor];
    [viewCon.view addSubview:webView];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    [webView loadRequest:request];
    [self.navigationController pushViewController:viewCon animated:YES];
}
@end

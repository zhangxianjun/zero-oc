//
//  ViewController.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/12.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
#import "LayoutKit.h"
#import "HeaderView.h"
#import "TerminalView.h"
#import "RouterKit.h"
#import <StoreKit/StoreKit.h>
#import <objc/runtime.h>

typedef NS_ENUM(NSInteger, ZCode) {
    ZCodeWaiting,
    ZCodeFinish,
};


static NSString const *key = @"xxxxx";

@interface ViewController ()<WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler>
@property (nonatomic, strong) HeaderView *headeView;
@property (nonatomic, strong) WKWebView *webView;
@end



@implementation ViewController

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.webView];
    
    NSString *content = [[NSBundle mainBundle] pathForResource:@"example" ofType:@"html"];
    
    NSURL *url = [NSURL fileURLWithPath:content];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    TerminalView *terminalView = [TerminalView initTerminal];
    
    __weak typeof(self) wSelf = self;
    terminalView.clickBlock = ^(NSUInteger tag) {
        if (tag == 0) {
            if ([wSelf.webView canGoBack]) {
                [wSelf.webView goBack];
            }
        } else if (tag == 1) {
            if ([wSelf.webView canGoForward]) {
                [wSelf.webView goForward];
            }
        } else if (tag == 2) {
            [wSelf.webView reload];
        } else {
            
        }
    };
    
    [self.view addSubview:terminalView];
    
    HeaderView *headerView = [HeaderView initHeader];
    headerView.address = url.absoluteString;
    self.headeView = headerView;
    [self.view addSubview:headerView];
    

}

// 移除监听JS脚本
- (void)dealloc {
    
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView.configuration.userContentController removeAllUserScripts];
}

#pragma mark - web page load state
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    CGFloat progress = [change[@"new"] floatValue];
    self.headeView.loadPercent = progress;
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    NSURL *url = navigationAction.request.URL;
    
    if ([url.scheme isEqual:@"zero"]) {
        [[RouterKit sharedRouter] exec:webView callback:^(NSString * _Nonnull input, NSString * _Nonnull funName, NSString * _Nonnull output) {
            NSString *js = [NSString stringWithFormat:@"zeroCallback('%@', '%@', '%@')", input, funName, output];
            
            NSLog(@"js拼接方法=%@", js);
            
            [self.webView evaluateJavaScript:js completionHandler:^(id _Nullable jsResult, NSError * _Nullable error) {
                NSLog(@"js执行结果===%@ %@", jsResult,  error);
            }];
        }];
    }
    
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
    
    NSLog(@"URL = %@", url);

    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    decisionHandler(WKNavigationResponsePolicyAllow);
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    self.headeView.address = webView.URL.absoluteString;
}

#pragma mark - WKUIDelegate
-(WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures {
    WKFrameInfo *frameInfo = navigationAction.targetFrame;
    if (frameInfo.isMainFrame) {
        
    }
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return nil;
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"%@", message.name);
    NSLog(@"%@", message.body);
    NSLog(@"%d", message.frameInfo.mainFrame);
}

#pragma mark - oc invoke js
- (void)ocInvokeJs {
    [self.webView evaluateJavaScript:@"zeroGetData()" completionHandler:^(id _Nullable jsResult, NSError * _Nullable error) {

        if (jsResult != nil) {
            
            int zCode = [jsResult[@"zCode"] intValue];
            
            // zCode等于11时网页中的接口请求已经完成!
            if (zCode == 11) {
//                NSDictionary *zData = jsResult[@"zData"];
            } else {
                NSLog(@"%@", jsResult[@"zMsg"]);
            }

        } else {
            NSLog(@"Html not init %@", jsResult);
        }
        
    }];
}

#pragma mark - js invoke oc
- (void)jsInvokeOc:(NSString *)s {
    NSLog(@"msgSend = %@", s);
}

#pragma mark - lazy
- (WKWebView *)webView {
    if (_webView == nil) {
        WKUserContentController *ucc = [[WKUserContentController alloc] init];
        [ucc addScriptMessageHandler:self name:@"zero"];
        
        WKWebViewConfiguration *wvc = [[WKWebViewConfiguration alloc] init];
        wvc.userContentController = ucc;
        
        CGFloat statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, statusHeight + 34, LayoutKit.getWidth, LayoutKit.getHeight - LayoutKit.getStatusHeight - LayoutKit.getTabBarHeight - 34) configuration:wvc];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return _webView;
}
@end

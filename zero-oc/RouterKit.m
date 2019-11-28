//
//  RouterKit.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "RouterKit.h"
#import <NSString+YYAdd.h>
#import <WebKit/WebKit.h>

@implementation RouterKit

+ (instancetype)sharedRouter {
    
    static RouterKit *kit = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        kit = [[RouterKit alloc] init];
    });
    
    return kit;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)exec:(WKWebView *)webView callback:(CallBack)callback {
    
    NSURL *url = webView.URL;
    
    NSLog(@"input = %@", webView.URL.query);
    NSLog(@"funName = %@", url.relativePath);
    
    if ([url.path isEqual:@"/camera"]) {
        
    } else if ([url.path isEqual:@"/photos"]) {
        
    } else if ([url.path isEqual:@"/md5"]) {
        
    } else if ([url.path isEqual:@"/base64"]) {
        callback([url.query base64EncodedString], [url.path base64EncodedString], [url.query base64EncodedString]);
    } else if ([url.path isEqual:@""]) {
        
    } else if ([url.path isEqual:@"/shotscreen"]) {
        [self shotScreen:webView];
    } else if ([url.path isEqual:@"base64"]) {
        
    } else if ([url.path isEqual:@"base64"]) {
        
    } else if ([url.path isEqual:@"base64"]) {
        
    } else if ([url.path isEqual:@"base64"]) {
        
    } else {
        NSLog(@"no support");
    }
}

// 截图功能
- (void)shotScreen:(WKWebView *)webView {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        UIGraphicsBeginImageContextWithOptions(webView.scrollView.contentSize, YES, 0);
        
        [webView.layer renderInContext:UIGraphicsGetCurrentContext()];
        
        UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        CGImageRef imageRef = viewImage.CGImage;
        UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRef];
        UIImageWriteToSavedPhotosAlbum(sendImage, nil, nil, nil);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    
    
}

@end

//
//  RouterKit.h
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WKWebView;

NS_ASSUME_NONNULL_BEGIN

typedef void(^CallBack)(NSString *input, NSString *funName, NSString *output);

@interface RouterKit : NSObject
+ (instancetype)sharedRouter;

- (void)exec:(WKWebView *)webView callback:(CallBack)callback;

@end

NS_ASSUME_NONNULL_END

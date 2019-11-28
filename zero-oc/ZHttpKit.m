//
//  ZHttpKit.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/19.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "ZHttpKit.h"
//#import <AFNetworking/AFNetworking.h>

@implementation ZHttpKit
+ (void)post:(NSString *)url params:(NSString *)json callback:(void(^)(NSString *json))callback {
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    });
//    
//    __block BOOL noNeting = NO;
//    
//    __block NSString *errorMsg = @"服务异常，请稍后再次尝试！";
//    
//    //检查网络
//    AFNetworkReachabilityManager *netManager = [AFNetworkReachabilityManager sharedManager];
//    [netManager startMonitoring];
//    
//    [netManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case AFNetworkReachabilityStatusUnknown:
//            {
//                //未知网络
//                NSLog(@"未知网络");
//                //                [HintUtil showToast:@"网络连接出现问题，请检查手机是否联网"];
//                errorMsg = @"网络连接出现问题，请检查手机是否联网";
//                
//                noNeting = YES;
//            }
//                break;
//            case AFNetworkReachabilityStatusNotReachable:
//            {
//                //无法联网
//                NSLog(@"无法联网");
//                errorMsg = @"网络连接出现问题，请检查手机是否联网";
//                
//                noNeting = YES;
//            }
//                break;
//                
//            case AFNetworkReachabilityStatusReachableViaWWAN:
//            {
//                //手机自带网络
//                NSLog(@"当前使用的是2g/3g/4g网络");
//            }
//                break;
//            case AFNetworkReachabilityStatusReachableViaWiFi:
//            {
//                //WIFI
//                NSLog(@"当前在WIFI网络下");
//            }
//        }
//    }];
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    //    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil]];
//    
//    //设置超时时间
//    manager.requestSerializer.timeoutInterval = 60;
//    
//    [manager POST:url parameters:json?:@{} progress:^(NSProgress * _Nonnull uploadProgress) {
//        
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
//        });
//        
//        if (responseObject) {
//            
//            NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//            
//            if (result.length > 3) {
//                
//                callback(result);
//            }
//            else {
//                
//            }
//        }
//        else {
//            
//        }
//        
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        
//        NSHTTPURLResponse * responses = (NSHTTPURLResponse *)task.response;
//        
//        NSLog(@"errorTask--- %@\n error- %@",responses.allHeaderFields,error);
//        
//        if (!noNeting) {
//            errorMsg = @"服务异常，请稍后再次尝试！";
//        }
//        
//        callback([NSString stringWithFormat:@"{\"code\":\"10001\", \"msg\":\"%@\"}", errorMsg]);
//    }];;
}
@end

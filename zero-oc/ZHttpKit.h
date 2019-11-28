//
//  ZHttpKit.h
//  zero-oc
//
//  Created by ZXJ on 2019/11/19.
//  Copyright © 2019 aliren. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZHttpKit : NSObject
+ (void)post:(NSString *)url params:(NSString *)json callback:(void(^)(NSString *json))callback;
@end

NS_ASSUME_NONNULL_END

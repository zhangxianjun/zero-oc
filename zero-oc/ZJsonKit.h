//
//  ZJsonKit.h
//  zero-oc
//
//  Created by ZXJ on 2019/11/25.
//  Copyright © 2019 aliren. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJsonKit : NSObject
+ (NSObject *)parse:(NSString *)json;
@end

NS_ASSUME_NONNULL_END

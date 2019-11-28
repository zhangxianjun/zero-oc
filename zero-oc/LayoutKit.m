//
//  LayoutKit.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "LayoutKit.h"

@implementation LayoutKit

+ (CGFloat)getHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)getWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)getStatusHeight {
    return [[UIApplication sharedApplication] statusBarFrame].size.height;
}

+ (CGFloat)getTabBarHeight {
    return [UIApplication sharedApplication].statusBarFrame.size.height > 20 ? 83 : 49;
}
@end

//
//  TestRunTime.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/20.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "TestRunTime.h"
#import <objc/runtime.h>
#import <malloc/malloc.h>

@implementation TestRunTime

- (void)getInstanceSize:(Class _Nullable)clz {
    NSLog(@"获取实例对象成员变量占用内存空间大小 %zu", class_getInstanceSize(clz));
}

- (void)getMallocSize:(NSObject *)obj {
    NSLog(@"获取实例对象占用内存空间大小 %zu", malloc_size((__bridge const void *) obj));
}
@end

//
//  TestOC.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/27.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "TestOC.h"
#import <objc/runtime.h>

// 内部测试基类
@interface TestBaseModel : NSObject
@property (nonatomic, assign) int age;
@end


@implementation TestBaseModel
- (void)t1 {
    
}

+ (void)t2 {
    
}
@end

// 内部测试类
@interface TestModel : NSObject

@end


@implementation TestModel
- (void)test1 {
    
}

+ (void)test2 {
    
}
@end


@interface TestOC ()
@property (nonatomic, strong) TestBaseModel *tbm;
@end


@implementation TestOC

- (instancetype)init {
    self = [super init];
    if (self != nil) {
        
        self.tbm = [TestBaseModel new];
        self.tbm.age = 10;
        
        TestBaseModel *m = [TestBaseModel new];
        m.age = 20;
        
        NSLog(@"%@ %@", self.tbm, m);
        NSLog(@"%p %p", object_getClass(self.tbm), object_getClass(m));
        
        [self.tbm addObserver:self forKeyPath:@"age" options:NSKeyValueObservingOptionNew |
         NSKeyValueObservingOptionOld context:nil];
        
        self.tbm.age = 11;
        m.age = 21;
        NSLog(@"%@ %@", self.tbm, m);
        NSLog(@"%p %p", [self.tbm class], [m class]);
        NSLog(@"class %p %p", object_getClass(self.tbm), object_getClass(m));
        
        NSLog(@"meta class %p %p", object_getClass(object_getClass(self.tbm)), object_getClass(object_getClass(m)));
        
        NSLog(@"%p", [self.tbm methodForSelector:@selector(setAge:)]);
        NSLog(@"%p", [m methodForSelector:@selector(setAge:)]);
        
        [self printMethodList:object_getClass(self.tbm)];
        
        [self printMethodList:[object_getClass(self.tbm) superclass]];
    }
    return self;
}

- (void)printMethodList:(Class)clz {
    unsigned int count;
    Method *methodList = class_copyMethodList(clz, &count);
    
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        NSLog(@"%@", NSStringFromSelector(method_getName(method)));
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@ %@", object, change);
}

- (void)dealloc {
    
//    [self.tbm removeObserver:self forKeyPath:@"age"];
//    [super dealloc];
}
@end

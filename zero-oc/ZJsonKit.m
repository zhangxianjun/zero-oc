//
//  ZJsonKit.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/25.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "ZJsonKit.h"

@implementation ZJsonKit
+ (NSObject *)parse:(NSString *)json {
    
//    NSJSONSerialization
    json = @"{\"key\": \"value\"}";

    
//    for (int i = 0; i < json.length; i++) {
        
//        char c = [json characterAtIndex:0];
    NSMutableString *tmp = [NSMutableString stringWithCapacity:10];
    [self getCharState:json tmp:tmp index:0];
//    }
    return nil;
}

+ (NSString *)getCharState:(NSString *)json tmp:(NSMutableString *)tmp index:(int)index {

    
    char c = [json characterAtIndex:index];
    if (c == ':') {
        // 结束读取key 开始读取value
        NSLog(@"读取key为%@", tmp);
//        return tmp;
    } else if (c == ',') {
        // 结束读取value
//        NSLog(@"读取value为%@", tmp);
//        return tmp
    } else if (c == '{') {
        // 开始读取key
        NSLog(@"开始读取对象");
        NSMutableDictionary *d = [NSMutableDictionary dictionaryWithCapacity:5];        
    } else if (c == '}') {
        // 结束读取value
        NSLog(@"读取value为%@", tmp);
        return tmp;
    } else if (c == '[') {
        // 中间状态
    } else if (c == ']') {
        
    } else if (c == '\"') {
        
    } else if (c == 'N') {
        
    } else if (c == 'T') {
        
    } else if (c == 'F') {
        
    } else if (c >= '0' && c <= 9) {
        
    } else {
        [tmp appendFormat:@"%c", c];
    }
    
    [self getCharState:json tmp:tmp index:index+1];
    
    return tmp;
}

//+ ()


+ (NSString *)stringify:(NSObject *)obj {
    return nil;
}
@end

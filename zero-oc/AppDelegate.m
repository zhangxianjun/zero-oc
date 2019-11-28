//
//  AppDelegate.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/12.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "ZJsonKit.h"
#import "TestOC.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    NSDictionary *dict = @{@"key": @"value"};
//
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
//
//    NSString *jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//
//    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    
    TestOC *test = [[TestOC alloc] init];
    
    
    
//    NSLog(@"%@", [ZJsonKit parse:@"{\"key\": \"value\"}"]);
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *vc = [[ViewController alloc] init];
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
//    NSLog(@"%@", NSHomeDirectory());
    
    return YES;
}
@end

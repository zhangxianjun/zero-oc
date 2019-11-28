//
//  TerminalView.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "TerminalView.h"
#import "LayoutKit.h"
#import <YYKit/YYKit.h>

@interface TerminalView ()
//@property (nonatomic, strong) UIButton *gobackButton;
//@property (nonatomic, strong) UIButton *forwardButton;
//@property (nonatomic, strong) UIButton *refreshButton;
//@property (nonatomic, strong) UIButton *homeButton;
@property (nonatomic, strong) NSArray<NSString *> *titleArray;
@end

@implementation TerminalView

+ (instancetype)initTerminal {
    return [[self alloc] initWithFrame:CGRectMake(0, LayoutKit.getHeight - LayoutKit.getTabBarHeight, LayoutKit.getWidth, LayoutKit.getTabBarHeight)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        self.backgroundColor = [UIColor colorWithHexString:@"#24292e"];
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    for (int i = 0; i < 4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundColor:[UIColor colorWithHexString:@"#24292e"]];
        [btn setFrame:CGRectMake(width/4 * i, 0, width/4, 49)];
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        btn.tag = i;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
}

- (void)buttonClicked:(UIButton *)sender {
    if (self.clickBlock != nil) {
        self.clickBlock(sender.tag);
    }
}


#pragma mark - lazy
- (NSArray *)titleArray {
    if (_titleArray == nil) {
        _titleArray = @[@"前进", @"后退", @"刷新", @"主页"];
    }
    return _titleArray;
}
//- (UIButton *)gobackButton {
//    if (_gobackButton == nil) {
//        _gobackButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        _gobackButton =
//    }
//    return _gobackButton;
//}
@end

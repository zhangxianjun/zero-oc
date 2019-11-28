//
//  HeaderView.m
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import "HeaderView.h"
#import "LayoutKit.h"
#import <YYKit/YYKit.h>

@interface HeaderView ()
@property (nonatomic, strong) UITextField *addressTF;
@property (nonatomic, strong) UIProgressView *loadingPV;
@end

@implementation HeaderView

+ (instancetype)initHeader {
    return [[self alloc] initWithFrame:CGRectMake(0, LayoutKit.getStatusHeight, LayoutKit.getWidth, 34)];
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        [self setBackgroundColor:[UIColor colorWithHexString:@"#24292e"]];
        [self addSubview:self.addressTF];
        [self addSubview:self.loadingPV];
    }
    return self;
}

- (void)setAddress:(NSString *)address {
    _address = address;
    self.addressTF.text = address;
}

- (void)setLoadPercent:(CGFloat)loadPercent {
    _loadPercent = loadPercent;
    if (loadPercent < 1.0) {
        self.loadingPV.hidden = NO;
        [self.loadingPV setProgress:loadPercent animated:YES];
    } else {
        self.loadingPV.hidden = YES;
        [self.loadingPV setProgress:0 animated:YES];
    }
}

#pragma mark - lazy
- (UITextField *)addressTF {
    if (_addressTF == nil) {
        _addressTF = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, LayoutKit.getWidth, 32)];
    }
    return _addressTF;
}

- (UIProgressView *)loadingPV {
    if (_loadingPV == nil) {
        _loadingPV = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 33, LayoutKit.getWidth, 1)];
    }
    return _loadingPV;
}
@end

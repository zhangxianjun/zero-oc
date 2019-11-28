//
//  TerminalView.h
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickBlock)(NSUInteger tag);

@interface TerminalView : UIView

@property (nonatomic, copy) ClickBlock clickBlock;

+ (instancetype)initTerminal;
@end

NS_ASSUME_NONNULL_END

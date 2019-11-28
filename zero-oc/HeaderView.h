//
//  HeaderView.h
//  zero-oc
//
//  Created by ZXJ on 2019/11/13.
//  Copyright © 2019 aliren. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView
+ (instancetype)initHeader;


@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) CGFloat loadPercent;
@end

NS_ASSUME_NONNULL_END

//
//  BrandingFactory.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BrandingFactory : NSObject

+ (BrandingFactory *)factory;

// 生产实际产品的实例方法
- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;

@end

NS_ASSUME_NONNULL_END

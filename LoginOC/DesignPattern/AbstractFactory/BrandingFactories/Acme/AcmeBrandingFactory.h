//
//  AcmeBrandingFactory.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "BrandingFactory.h"

NS_ASSUME_NONNULL_BEGIN

/// 具体品牌工厂中重载方法，实现具体产品的创建
@interface AcmeBrandingFactory : BrandingFactory

- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolbar;

@end

NS_ASSUME_NONNULL_END

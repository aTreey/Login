//
//  BusinessCardAdapterProtocol.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 适配器的抽象类协议
NS_ASSUME_NONNULL_BEGIN

@protocol BusinessCardAdapterProtocol <NSObject>

- (NSString *)name;

- (UIColor *)lineColor;

- (NSString *)phoneNumber;

@end

NS_ASSUME_NONNULL_END

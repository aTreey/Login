//
//  BaseDevice.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhoneProtocol.h"

NS_ASSUME_NONNULL_BEGIN
// 手机抽象类，使用协议表示手机的公有特性
@interface BaseDevice : NSObject <PhoneProtocol>

@end

NS_ASSUME_NONNULL_END

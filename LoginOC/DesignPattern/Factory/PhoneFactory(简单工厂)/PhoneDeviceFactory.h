//
//  PhoneDeviceFactory.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDevice.h"


NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, PhoenDeviceType) {
    PhoenDeviceTypeiPhone,
    PhoenDeviceTypeAndorid,
    PhoenDeviceTypeNokia,
};

/// 本事便利构造器，根据客户端发出的具体指令，返回一个具体设备
@interface PhoneDeviceFactory : NSObject

/// 根据类型创建出手机
/// @param type 手机类型
+ (BaseDevice<PhoneProtocol> *)phoneDeviceFactoryWithType:(PhoenDeviceType)type;

@end

NS_ASSUME_NONNULL_END

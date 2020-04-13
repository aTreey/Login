//
//  PhoneDeviceFactory.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "PhoneDeviceFactory.h"
#import "iPhoneDevice.h"
#import "AndoridDevice.h"
#import "NokiaDevice.h"

@implementation PhoneDeviceFactory

+ (BaseDevice *)phoneDeviceFactoryWithType:(PhoenDeviceType)type {
    BaseDevice *device = nil;
    switch (type) {
        case PhoenDeviceTypeiPhone:
            device = [iPhoneDevice new];
            break;
        case PhoenDeviceTypeAndorid:
            device = [AndoridDevice new];
            break;
        case PhoenDeviceTypeNokia:
            device = [NokiaDevice new];
            break;
    }
    return device;
}

@end

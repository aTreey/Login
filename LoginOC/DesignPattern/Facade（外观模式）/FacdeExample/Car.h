//
//  Car.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/15.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 复杂系统之一： 汽车类
@interface Car : NSObject

/**
 定义操作car内部对象的方法
 */

/// 松刹车
- (void) releaseBrakes;
/// 换挡
- (void) changeGears;
/// 踩油门
- (void) pressAccelerator;
/// 踩刹车
- (void) pressBrakes;
/// 松油门
- (void) releaseAccelerator;

@end

NS_ASSUME_NONNULL_END

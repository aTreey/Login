//
//  Taximeter.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/15.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

///复杂系统之二：计价器
// 是个复杂的操作系统，提供两个方法让客户端操作对象的方法
@interface Taximeter : NSObject

- (void) start;
- (void) stop;

@end

NS_ASSUME_NONNULL_END

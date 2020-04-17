//
//  CabDriver.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/15.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 计程车司机类：作为“外观”以简化汽车类（Car）和 计价器类（Taximeter）接口
@interface CabDriver : NSObject

- (void) driveToLocation:(CGPoint)location;

@end

NS_ASSUME_NONNULL_END

//
//  BridgeBaseA.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BridgeBaseB;

NS_ASSUME_NONNULL_BEGIN

@interface BridgeBaseA : NSObject

/// 桥接设计模式的核心实现
@property (nonatomic, strong) BridgeBaseB *objB;

/// 获取数据
- (void)handle;

@end

NS_ASSUME_NONNULL_END

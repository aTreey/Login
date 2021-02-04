//
//  PrototypeCopyProtocol.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 原型模式协议
@protocol PrototypeCopyProtocol <NSObject>

@required

/// 返回自己的clone样式
- (id)clone;

@end

NS_ASSUME_NONNULL_END

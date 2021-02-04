//
//  Prototype_BaseCopyObject.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Prototype_BaseCopyObject : NSObject<NSCopying>

- (id)copyWithZone:(NSZone *)zone;

/// 复制由子类重载
/// @param obj 子类对象
- (void)copyOperationWithObj:(id)obj;

@end

NS_ASSUME_NONNULL_END

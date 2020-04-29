//
//  NSMutableArray+Stack.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/28.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 利用数组自定义栈结构
 */
NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Stack)

/// 入栈
/// @param object 对象
- (void)push:(id)object;

/// 出栈
- (id)pop;

@end

NS_ASSUME_NONNULL_END

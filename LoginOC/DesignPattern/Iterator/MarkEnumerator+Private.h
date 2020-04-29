//
//  MarkEnumerator+Private.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/28.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "MarkEnumerator.h"


// 定义私有方法
NS_ASSUME_NONNULL_BEGIN

@interface MarkEnumerator ()

// 创建时需要知道处理什么Mark，定义私有方法initWithMark:
- (id)initWithMark:(id <Mark>)mark;

- (void)traverseAndBuildStackWithMark:(id <Mark>)mark;

@end

NS_ASSUME_NONNULL_END

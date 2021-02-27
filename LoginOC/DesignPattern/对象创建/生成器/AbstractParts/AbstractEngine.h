//
//  AbstractEngine.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/4.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AbstractEngine <NSObject>

@required

/// 引擎尺寸
/// @param size 大小
- (void)engineSize:(CGFloat)size;

/// 重量
/// @param weight 重量
- (void)engineWeight:(CGFloat)weight;

/// 信息
- (NSString *)engineInfo;

@end

NS_ASSUME_NONNULL_END

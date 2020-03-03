//
//  Father_cycle.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/10.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Son_cycle;

NS_ASSUME_NONNULL_BEGIN

@interface Father_cycle : NSObject
@property (nonatomic, strong) Son_cycle *son;

/// 被strong 修饰的title，又被修改的风险
@property (nonatomic, strong) NSString *title_strong;

/// 被copy 修饰
@property (nonatomic, copy) NSString *title_copy;

/// 可变字符串
@property (nonatomic, copy) NSMutableString *name_mutable;

@property (nonatomic, assign) int workID;


@end

NS_ASSUME_NONNULL_END

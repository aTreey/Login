//
//  SubscripServiceCenter.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/5/20.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubscriptionServiceCenterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/// 订阅服务中心 -- 单例  (类似书刊发行机构)
/// 注意：循环引用问题，使用NSHashTable 实现 weak 引用
@interface SubscriptionServiceCenter : NSObject

/**
 抽象出方法 （为了让书刊发行机构和各种书刊发生联系）
 */

/// 创建订阅
/// @param number 订阅号
+ (void)creatSubscriptionNumber:(NSString *)number;

/// 移除订阅
/// @param number 订阅号
+ (void)removeSubscriptionNumber:(NSString *)number;

/// 添加客户到具体的订阅号中
/// @param customer 客户
/// @param number 订阅号
+ (void)addCustomer:(id<SubscriptionServiceCenterProtocol>)customer subscriptionNumber:(NSString *)number;

/// 移除客户到具体的订阅号中
/// @param customer 客户
/// @param number 订阅号
+ (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>)customer subscriptionNumber:(NSString *)number;

/// 发送消息到具体的订阅号
/// @param message 消息
/// @param number 订阅号
+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)number;

@end

NS_ASSUME_NONNULL_END

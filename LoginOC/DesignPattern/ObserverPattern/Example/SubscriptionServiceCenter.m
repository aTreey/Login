//
//  SubscripServiceCenter.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/5/20.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "SubscriptionServiceCenter.h"

static NSMutableDictionary *_subscriptionDictionary = nil;


@implementation SubscriptionServiceCenter

/// 类第一次调用的时候初始化一次
+ (void)initialize {
    if (self == [SubscriptionServiceCenter class]) {
        _subscriptionDictionary = [NSMutableDictionary dictionary];
    }
}

+ (void)creatSubscriptionNumber:(NSString *)number {
    NSParameterAssert(number);
    NSHashTable *hashTable = [self existSubscriptionNumber:number];
    if (!hashTable) {
        // 创建订阅号
        hashTable = [NSHashTable weakObjectsHashTable];
        // 保存在发行机构中
        [_subscriptionDictionary setObject:hashTable forKey:number];
    }
}

+ (void)removeSubscriptionNumber:(NSString *)number {
    NSParameterAssert(number);
    NSHashTable *hashTable = [self existSubscriptionNumber:number];
    if (hashTable) {
        // 移除
        [_subscriptionDictionary removeObjectForKey:number];
    }
}

+ (void)addCustomer:(id<SubscriptionServiceCenterProtocol>)customer subscriptionNumber:(NSString *)number {
    // 验证参数
    NSParameterAssert(customer);
    NSParameterAssert(number);
    
    NSHashTable *hashTable = [self existSubscriptionNumber:number];
    // NSHashTable 是一个NSSet, 可以重复添加
    // 对nil也可以发消息
    [hashTable addObject:customer];
}

+ (void)removeCustomer:(id<SubscriptionServiceCenterProtocol>)customer subscriptionNumber:(NSString *)number {
    // 验证参数
    NSParameterAssert(number);
    NSHashTable *hashTable = [self existSubscriptionNumber:number];
    // 集合移除nil
    [hashTable removeObject:customer];
}

+ (void)sendMessage:(id)message toSubscriptionNumber:(NSString *)number {
    // 获取某个书刊
    NSHashTable *hashTable = [self existSubscriptionNumber:number];
    if (hashTable) {
        // 书刊中的用户信息
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        id <SubscriptionServiceCenterProtocol> objc = nil;
        while (objc = [enumerator nextObject]) {
            if ([objc respondsToSelector:@selector(subscriptionMessgae:number:)]) {
                [objc subscriptionMessgae:message     number:number];
            }
        }
    }
}


#pragma mark -
#pragma mark - private

// 订阅号是否存在

+ (NSHashTable *)existSubscriptionNumber:(NSString *)number {
    return [_subscriptionDictionary objectForKey:number];
}


@end

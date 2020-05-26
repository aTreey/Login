//
//  SubscriptionServiceCenterProtocol.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/5/20.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 定义协议来约束 SubscriptionServiceCenter 可以接受的id
@protocol SubscriptionServiceCenterProtocol <NSObject>

/// 接收到消息
/// @param message 消息
/// @param number 被订阅者
- (void)subscriptionMessgae:(id)message number:(NSString *)number;

@end

NS_ASSUME_NONNULL_END

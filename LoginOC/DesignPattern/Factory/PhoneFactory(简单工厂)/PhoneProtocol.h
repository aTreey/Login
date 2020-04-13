//
//  PhoneProtocol.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PhoneProtocol <NSObject>

@required

/// 打电话
- (void)call;

/// 发信息
- (void)sendMessage;

@end

NS_ASSUME_NONNULL_END

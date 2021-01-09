//
//  RunTimeObject.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/8.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RunTimeObject : NSObject
// 只声明，不实现，验证消息转发机制
- (void)test;

- (void)exchangeMethodTest;

- (void)otherTest;
@end

NS_ASSUME_NONNULL_END

//
//  TouchConsoleController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/31.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ConsoleController.h"

NS_ASSUME_NONNULL_BEGIN

/// 创建一个虚拟控制器
@interface TouchConsoleController : ConsoleController

/// 每个方法只是用适当的 ConsoleCommands 值向 super 发送一个 [super setCommand] 消息;
- (void)up;
- (void)down;
- (void)left;
- (void)right;
- (void)select;
- (void)start;
- (void)action1;
- (void)action2;

@end

NS_ASSUME_NONNULL_END

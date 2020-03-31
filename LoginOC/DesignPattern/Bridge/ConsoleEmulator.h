//
//  ConsoleEmulator.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleCommands.h"

NS_ASSUME_NONNULL_BEGIN

/// 仿真器的抽象类，为其子类定义了接口，
@interface ConsoleEmulator : NSObject

/// 将任何具体的操作系统指令加载到内部数据结构中
/// @param command ConsoleCommand 命令
- (void) loadInstructionsForCommand:(ConsoleCommand)command;

/// 执行加载到这个数据结构中的指令
- (void) executeInstructions;

@end

NS_ASSUME_NONNULL_END

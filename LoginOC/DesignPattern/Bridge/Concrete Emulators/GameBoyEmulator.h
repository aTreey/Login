//
//  GameBoyEmulator.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ConsoleEmulator.h"

NS_ASSUME_NONNULL_BEGIN

/// 具体的GameBoy仿真器
@interface GameBoyEmulator : ConsoleEmulator

/**
 重载抽象类中的方法， 以提供自己的特定平台
 */

- (void)loadInstructionsForCommand:(ConsoleCommand)command;

- (void)executeInstructions;

/**
 其他行为
 */
- (void)doSomeThing;

@end

NS_ASSUME_NONNULL_END

//
//  GameGearEmulator.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/31.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ConsoleEmulator.h"

NS_ASSUME_NONNULL_BEGIN

@interface GameGearEmulator : ConsoleEmulator

/**
 重载抽象类中的方法， 以提供自己的特定平台
 */

- (void)loadInstructionsForCommand:(ConsoleCommand)command;

- (void)executeInstructions;

@end

NS_ASSUME_NONNULL_END

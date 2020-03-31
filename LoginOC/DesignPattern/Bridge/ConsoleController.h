//
//  ConsoleController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsoleEmulator.h"

NS_ASSUME_NONNULL_BEGIN

/// 虚拟控制器的抽象类
@interface ConsoleController : NSObject

/**
 在整个虚拟控制器类层次的起点封装一个对 ConsoleEmulator 的引用，是联系两者的唯一方式，
 因此 ConsoleController 的实例可以在一个抽象层次上使用 ConsoleEmulator 的实例
 */
@property (nonatomic, strong) ConsoleEmulator *emulator;


/// 提供子类用预先定义的命令类型输入命令
/// @param command 命令类型
- (void)setCommand:(ConsoleCommand)command;

@end

NS_ASSUME_NONNULL_END

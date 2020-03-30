//
//  ConsoleCommands.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#ifndef ConsoleCommands_h
#define ConsoleCommands_h

/// 定义任何仿真器都应支持的命令
typedef NS_ENUM(NSUInteger, ConsoleCommand) {
    kConsoleCommandUp,
    kConsoleCommandDown,
    kConsoleCommandLeft,
    kConsoleCommandRight,
    kConsoleCommandSelect,
    kConsoleCommandStart,
    kConsoleCommandAction1,
    kConsoleCommandAction2
};

#endif /* ConsoleCommands_h */


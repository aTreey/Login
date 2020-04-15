//
//  GameBoyEmulator.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "GameBoyEmulator.h"

@implementation GameBoyEmulator
/**
重载抽象类中的方法， 以提供自己的特定平台
*/

- (void)loadInstructionsForCommand:(ConsoleCommand)command {
    NSLog(@" GameBoyEmulator loadInstructionsForCommand = %lu", (unsigned long)command);
}
/**
重载抽象类中的方法， 以提供自己的特定平台
*/

- (void)executeInstructions {
    NSLog(@" GameBoyEmulator executeInstructions");
}

@end

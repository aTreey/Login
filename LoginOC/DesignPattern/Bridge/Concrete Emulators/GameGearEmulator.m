//
//  GameGearEmulator.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/31.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "GameGearEmulator.h"

@implementation GameGearEmulator
/**
重载抽象类中的方法， 以提供自己的特定平台
*/

- (void)loadInstructionsForCommand:(ConsoleCommand)command {
    NSLog(@" GameGearEmulator loadInstructionsForCommand = %lu", (unsigned long)command);
}
/**
重载抽象类中的方法， 以提供自己的特定平台
*/

- (void)executeInstructions {
    NSLog(@" GameGearEmulator executeInstructions");
}

@end

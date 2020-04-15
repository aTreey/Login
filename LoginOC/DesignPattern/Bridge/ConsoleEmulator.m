//
//  ConsoleEmulator.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ConsoleEmulator.h"

@implementation ConsoleEmulator

- (void)loadInstructionsForCommand:(ConsoleCommand)command {
    NSLog(@"加载指令 --- %@", [self class]);
}
 
- (void)executeInstructions {
    NSLog(@"executeInstructions 指令 --- %@", [self class]);
}

@end

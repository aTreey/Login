
//
//  ConsoleController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/30.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ConsoleController.h"

@implementation ConsoleController

- (void)setCommand:(ConsoleCommand)command {
    [self.emulator loadInstructionsForCommand:command];
    [self.emulator executeInstructions];
}

@end

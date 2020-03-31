//
//  TouchConsoleController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/31.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "TouchConsoleController.h"

@implementation TouchConsoleController

- (void)up
{
  [super setCommand:kConsoleCommandUp];
}

- (void)down
{
  [super setCommand:kConsoleCommandDown];
}

- (void)left
{
  [super setCommand:kConsoleCommandLeft];
}

- (void)right
{
  [super setCommand:kConsoleCommandRight];
}

- (void)select
{
  [super setCommand:kConsoleCommandSelect];
}

- (void)start
{
  [super setCommand:kConsoleCommandStart];
}

- (void)action1
{
  [super setCommand:kConsoleCommandAction1];
}

- (void)action2
{
  [super setCommand:kConsoleCommandAction2];
}

@end

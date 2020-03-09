//
//  Character.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/5.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "Character.h"

@implementation Character

- (instancetype)init {
    if (self = [super init]) {
        [self initData];
    }
    return self;
}

- (void)initData {
    self.protection = 1.0;
    self.power = 1.0;
    self.strength = 1.0;
    self.stamina = 1.0;
    self.intelligence = 1.0;
    self.agility = 1.0;
    self.aggressiveness = 1.0;
}

@end

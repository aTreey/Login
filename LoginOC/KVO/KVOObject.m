//
//  KVOObject.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/5.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "KVOObject.h"

@implementation KVOObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.value = 0;
    }
    return self;
}

- (void)setValue:(NSInteger)value {
    _value = value;
    NSLog(@"setter ----%ld",value);
}

- (void)increase {
    // 需要手动调用KVO
    [self willChangeValueForKey:@"value"];
    // 直接对成员变量赋值，没法出发KVO
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

@end

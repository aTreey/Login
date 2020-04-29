
//
//  NSMutableArray+Stack.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/28.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object {
    [self addObject:object];
}

- (id)pop {
    if (self.count == 0) {
        return nil;
    }
    id object = self.lastObject;
    [self removeLastObject];
    return object;
}
@end

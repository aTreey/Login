//
//  MarkEnumerator.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/27.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "MarkEnumerator.h"
#import "MarkEnumerator+Private.h"
#import "NSMutableArray+Stack.h"

@interface MarkEnumerator ()

@property (nonatomic, strong, readwrite) NSMutableArray *stack;

@end

@implementation MarkEnumerator

- (NSArray *)allObjects {
    // 返回还未访问的Mark节点数组
    // 也就是栈中的剩余元素
    return [[self.stack reverseObjectEnumerator] allObjects];
}

- (id)nextObject {
    return [self.stack pop];
}


#pragma mark -
#pragma mark - 私有方法

- (id)initWithMark:(id)mark {
    if (self = [super init]) {
        self.stack = [[NSMutableArray alloc] initWithCapacity:[mark count]];
    }
    // 倒序遍历,添加到私有栈中
    [self traverseAndBuildStackWithMark:mark];
    return self;
}

- (void)traverseAndBuildStackWithMark:(id<Mark>)mark {
    if (mark == nil) {
        return;
    }
    
    [self.stack push:mark];
    
    NSUInteger index = [mark count];
    id <Mark> childMark;
    while (childMark == [childMark childMarkAtIndex:--index]) {
        [self traverseAndBuildStackWithMark:childMark];
    }
}


//////////////////////// test //////////////////
- (void)test {
    NSArray *strArray = @[@"1", @"2", @"3", @"4"];
    // 使用 NSEnumerator 枚举集合对象中的元素
    NSEnumerator *itemEnumerator = [strArray objectEnumerator];
    NSString *item;
    
    while (item == [itemEnumerator nextObject]) {
        NSLog(@"item === %@", item);
    }
}

@end

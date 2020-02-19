//
//  Stroke.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Stroke.h"

@implementation Stroke
@synthesize size = size_, color = color_;
@dynamic location;

- (instancetype)init {
    if (self = [super init]) {
        children_ = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location {
    // 不做任何设置
}

- (CGPoint)location {
    if ([children_ count] > 0) {
        id<Mark> objc = [children_ objectAtIndex:0];
        return [objc location];
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark {
    [children_ addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    // 如果mark 在这一层，将其移除并且返回
    // 否则，让每个子节点去找它
    if ([children_ containsObject:mark]) {
        [children_ removeObject:mark];
    } else {
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index {
    if (index > ([children_ count])) {
        return nil;
    }
    return [children_ objectAtIndex:index];
}

// 返回最后子节点的便利方法
- (id<Mark>)lastChild {
    return [children_ lastObject];
}

- (NSUInteger)count {
    return children_.count;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    [strokeCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    [strokeCopy setSize:size_];
    
    for (id <Mark> child in children_) {
        [strokeCopy addMark:child];
    }
    return strokeCopy;
}

@end

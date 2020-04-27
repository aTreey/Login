//
//  Stroke.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Stroke.h"

@interface Stroke ()

@property (nonatomic, readwrite) NSUInteger count;
@property (nonatomic, readwrite) id <Mark> lastChild;
@property (nonatomic, strong) NSMutableArray *children;


@end

@implementation Stroke

//@synthesize size = size_, color = color_;
@dynamic location;

- (instancetype)init {
    if (self = [super init]) {
        self.children = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

#pragma mark -
#pragma mark - setter / getter

- (void)setLocation:(CGPoint)location {
    // 不做任何设置
}

- (CGPoint)location {
    // 返回第一个子节点位置
    if ([self.children count] > 0) {
        id<Mark> objc = [self.children objectAtIndex:0];
        return [objc location];
    }
    // 否则，返回原点
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark {
    [self.children addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    // 如果mark 在这一层，将其移除并且返回
    // 否则，让每个子节点去找它
    if ([self.children containsObject:mark]) {
        [self.children removeObject:mark];
    } else {
        // 把搜索操作传递给每个子节点，因此搜索会一直递归下去，直到达到树的最后一个子节点
        [self.children makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index {
    if (index > ([self.children count])) {
        return nil;
    }
    return [self.children objectAtIndex:index];
}

// 返回最后子节点的便利方法
- (id<Mark>)lastChild {
    return [self.children lastObject];
}

- (NSUInteger)count {
    return self.children.count;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    [strokeCopy setColor:[UIColor colorWithCGColor:[self.color CGColor]]];
    [strokeCopy setSize:self.size];
    
    for (id <Mark> child in self.children) {
        [strokeCopy addMark:child];
    }
    return strokeCopy;
}

#pragma mark -
#pragma mark - 绘图方法

- (void)drawWithContext:(CGContextRef)context {
    CGContextMoveToPoint(context, self.location.x, self.location.y);
    
    for (id <Mark> mark  in self.children) {
        [mark drawWithContext:context];
    }
    CGContextSetStrokeColorWithColor(context, self.color.CGColor);
    CGContextStrokePath(context);
}


@end

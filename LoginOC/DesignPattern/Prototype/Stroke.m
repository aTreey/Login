//
//  Stroke.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Stroke.h"
#import "MarkEnumerator+Private.h"

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

#pragma mark -
#pragma mark - 迭代器模式

- (NSEnumerator *)enumerator {
    return [[MarkEnumerator alloc] initWithMark:self];
}

#pragma mark -
#pragma mark - 访问者模式协议
/// stroke 跟Dot和Vertex不同，stroke 是一个组合类，需要管理子节点

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    // 后续遍历，子节点会先于其父节点被访问，需要保证所有的顶点verter都被处理了之后，再在stroke中执行最终的步骤
    for (id<Mark> dot in self.children) {
        [dot acceptMarkVisitor:visitor];
    }
    [visitor visitStroke:self];
}

@end

//
//  Vertex.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/22.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex

// 属性的 setter 与 getter 方法由用户自己实现，不自动生成
@dynamic color, size;

- (id)initWithLocation:(CGPoint)location {
    if (self = [super init]) {
        [self setLocation:location];
    }
    return self;
}

#pragma mark -
#pragma mark - NSCopying

// 此方法需要实现，以支持备忘录

- (id)copyWithZone:(NSZone *)zone {
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
}

#pragma mark -
#pragma mark - Mark 操作什么也不做

- (void)addMark:(nonnull id<Mark>)mark {
    
}

- (void)removeMark:(nonnull id<Mark>)mark {
    
}

- (nonnull id<Mark>)childMarkAtIndex:(NSUInteger)index {
    return nil;
}

- (id<Mark>)lastChild {
    return nil;
}

- (NSUInteger)count {
    return 0;
}


#pragma mark - 默认属性什么都不做
#pragma mark - setter / getter

- (void)setColor:(UIColor *)color {
    
}

- (void)setSize:(CGFloat)size {
    
}

- (UIColor *)color {
    return nil;
}

- (CGFloat)size {
    return 0.0;
}


#pragma mark -
#pragma mark - 绘图方法

/// Vertex 的绘制方法，顶点只提供线条中的特定位置，只会在上下文中用位置（坐标）往线上添加一个点
/// @param context <#context description#>
- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    
    CGContextAddLineToPoint(context, x, y);
}

@end

//
//  Vertex.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/22.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Vertex.h"

@implementation Vertex
@synthesize location = location_;
@dynamic color, size;

- (id)initWithLocation:(CGPoint)location {
    if (self = [super init]) {
        [self setLocation:location];
    }
    return self;
}

- (void)addMark:(nonnull id<Mark>)mark {
    
}

- (nonnull id<Mark>)childMarkAtIndex:(NSUInteger)index {
    return nil;
}

- (void)removeMark:(nonnull id<Mark>)mark {
    
}

#pragma mark -
#pragma mark - NSCopying

// 此方法需要实现，以支持备忘录

- (id)copyWithZone:(NSZone *)zone {
    Vertex *vertexCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    return vertexCopy;
}

// 默认属性什么都不做

#pragma mark - setter
- (void)setColor:(UIColor *)color {
    
}

- (void)setSize:(CGFloat)size {
    
}

#pragma mark - getter

- (id<Mark>)lastChild {
    return nil;
}

- (UIColor *)color {
    return nil;
}

- (CGFloat)size {
    return 0.0;
}


@end

//
//  DropitBehavior.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/24.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "DropitBehavior.h"

@interface DropitBehavior ()

/// 重力行为
@property (nonatomic, strong) UIGravityBehavior *gravity;
/// 碰撞行为
@property (nonatomic, strong) UICollisionBehavior *collision;

@end

@implementation DropitBehavior

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}


#pragma mark - Public

- (void)addItem:(id<UIDynamicItem>)item {
    [self.gravity addItem:item];
    [self.collision addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item {
    [self.gravity removeItem:item];
    [self.collision removeItem:item];
}


#pragma mark - Private

- (void)setup {
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collision];
}

#pragma mark - Getter

- (UIGravityBehavior *)gravity {
    if (!_gravity) {
        _gravity = [[UIGravityBehavior alloc] init];
        _gravity.magnitude = 0.9;
    }
    return _gravity;
}

- (UICollisionBehavior *)collision {
    if (!_collision) {
        _collision = [[UICollisionBehavior alloc] init];
        _collision.translatesReferenceBoundsIntoBoundary = YES;
    }
    return _collision;
}

@end

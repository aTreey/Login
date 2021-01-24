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
@property (nonatomic, strong) UIDynamicItemBehavior *animationOptions;

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
    [self.animationOptions addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item {
    [self.gravity removeItem:item];
    [self.collision removeItem:item];
    [self.animationOptions removeItem:item];
}

#pragma mark - Private

- (void)setup {
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collision];
    [self addChildBehavior:self.animationOptions];
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

- (UIDynamicItemBehavior *)animationOptions {
    if (!_animationOptions) {
        _animationOptions = [[UIDynamicItemBehavior alloc] init];
        _animationOptions.allowsRotation = NO;
    }
    return _animationOptions;
}

@end

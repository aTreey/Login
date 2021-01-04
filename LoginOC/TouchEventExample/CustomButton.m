//
//  CustomButton.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/5.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

/**
 重写hitTest
 */

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled || self.isHidden || self.alpha <= 0.01) {
        return nil;
    }
    
    if (![self pointInside:point withEvent:event]) {
        return nil;
    }
    
    // 触摸点在视图范围内，遍历当前对象的子视图
    __block UIView *hitView = nil;
    [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 坐标转换到子视图的坐标系中
        CGPoint convertPoint = [self convertPoint:point toView:obj];
        // 调用子视图的hitTest
        hitView = [obj hitTest:convertPoint withEvent:event];
        if (hitView) {
            *stop = YES;
        }
    }];
    if (hitView) {
        return hitView;
    }
    return self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat x = point.x;
    CGFloat y = point.y;
    
    CGFloat x1 = self.frame.size.width / 2.0;
    CGFloat y1 = self.frame.size.height / 2.0;
    
    CGFloat dis = sqrt((x1 - x) * (x1 - x) + (y1 - y) * (y1 - y));
    return dis <= x1;
}

@end

//
//  Dot.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Dot.h"

@implementation Dot
@synthesize size = size_, color = color_;

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    // 复制color，location 和size 都可以直接赋值给副本，但是color 需要使用CGColor 生成一个UIColor
    [dotCopy setColor:[UIColor colorWithCGColor:[self.color CGColor]]];
    // 复制size
    [dotCopy setSize:self.size];
    return dotCopy;
}


/// 绘图方法
/// @param context 绘制上下文
- (void)drawWithContext:(CGContextRef)context {
    CGFloat x = self.location.x;
    CGFloat y = self.location.y;
    CGFloat frameSize = self.size;
    CGRect frame = CGRectMake(x - frameSize / 2.0,
                              y - frameSize / 2.0,
                              frameSize,
                              frameSize);
    
    CGContextSetFillColorWithColor (context,[self.color CGColor]);
    CGContextFillEllipseInRect(context, frame);
}

#pragma mark - 
#pragma mark - 访问者模式协议
- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor {
    [visitor visitDot:self];
}

@end

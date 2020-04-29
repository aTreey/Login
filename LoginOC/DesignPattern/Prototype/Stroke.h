//
//  Stroke.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN
/// 画笔类
@interface Stroke : NSObject <Mark, NSCopying>
/// 使用私有变量来设置属性
{
    @private
//    UIColor *color_;
//    CGFloat size_;
//    NSMutableArray *children_;
}

/**
 Stroke是个组合类，跟Vertex 和Dot不同，需要实现Mark协议中所有的方法和属性
 */

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (void)addMark:(id <Mark>)mark;
- (void)removeMark:(id <Mark>)mark;
- (id <Mark>)childMarkAtIndex:(NSUInteger)index;


/// 绘图方法，把上下文移动到其子节点的第一个点，然后使用函数完成整条线的绘制
/// @param context 上下文
- (void)drawWithContext:(CGContextRef)context;

- (NSEnumerator *)enumerator;

@end

NS_ASSUME_NONNULL_END

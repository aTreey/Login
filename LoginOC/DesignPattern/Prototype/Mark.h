//
//  Mark.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/21.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@protocol Mark <NSObject>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count; // 子节点的个数
@property (nonatomic, readonly) id <Mark> lastChild;

// 返回实现类的一个实例
- (id)copy;

/**
 addMark、removeMark 两个方法 只对Stroke 这个类有意义 对Dot没有作用，因为Dot实例没有任何组合，之所以组合的操作声明在最上层的抽象接口中的理由是，不想让客户端在添加或删除子节点时做任何运行时检查来判断Mark实例是不是Stroke
 */

- (void)addMark:(id <Mark>) mark;
- (void)removeMark:(id <Mark>) mark;
- (id <Mark>)childMarkAtIndex:(NSUInteger) index;

// 添加绘图操作，让每个节点可以根据其特定的目的绘制自己
- (void) drawWithContext:(CGContextRef) context;

@end

NS_ASSUME_NONNULL_END

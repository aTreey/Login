//
//  MarkVisitor.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/6/10.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Mark;
@class Dot, Vertex, Stroke;

NS_ASSUME_NONNULL_BEGIN
/// 定义为协议的理由是防止将来的访问者的实现类可能会子类化

/// 定义Mark组合体的各种访问操作， Mark 和其子类每个节点都添加一个新方法----- acceptMarkVisitor：，把访问者传递给Mark 组合体，客户端不知道访问者如何在流水线中传递，但是每个访问者对象访问某个节点时，节点的acceptMarkVisitor：方法会向访问者发送相应的visitor 消息，并执行适应的操作
@protocol MarkVisitor <NSObject>

// 每个方法只能用于访问一种特定类型的节点
- (void)visitMark:(id <Mark>)mark;
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertex;
- (void)visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END

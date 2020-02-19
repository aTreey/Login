//
//  Dot.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Vertex.h"

NS_ASSUME_NONNULL_BEGIN

/// 包括颜色、大小、位置等信息
@interface Dot : Vertex
{
    @private
    UIColor *color_;
    CGFloat size_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;


// for the Visitor pattern 访客模式
//- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

// for the Prototype pattern 原型模式
- (id) copyWithZone:(NSZone *)zone;

// for the Memento pattern
- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;


@end

NS_ASSUME_NONNULL_END

//
//  Vertex.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/22.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN


/// Vertex 对象用于组成线条，并不包含颜色、大小等其他信息
@interface Vertex : NSObject <Mark, NSCopying>

{
  //  受保护的属性，自己和子类可以使用
  @protected
  CGPoint location_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSInteger count; // 子节点的个数
@property (nonatomic, readonly) id <Mark> lastChild;

// 返回实现类的一个实例
- (id)initWithLocation:(CGPoint)location;
- (void)addMark:(id <Mark>) mark;
- (void)removeMark:(id <Mark>) mark;
- (id <Mark>)childMarkAtIndex:(NSUInteger) index;
- (id)copyWithZone:(NSZone *)zone;

@end

NS_ASSUME_NONNULL_END

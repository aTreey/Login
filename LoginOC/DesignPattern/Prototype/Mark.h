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
@property (nonatomic, readonly) NSInteger count; // 子节点的个数
@property (nonatomic, readonly) id <Mark> lastChild;

// 返回实现类的一个实例
- (id)copy;
- (void)addMark:(id <Mark>) mark;
- (void)removeMark:(id <Mark>) mark;
- (id <Mark>)childMarkAtIndex:(NSUInteger) index;

@end

NS_ASSUME_NONNULL_END

//
//  Stroke.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/24.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stroke : NSObject <Mark, NSCopying>
/// 使用私有变量来设置属性
{
    @private
    UIColor *color_;
    CGFloat size_;
    NSMutableArray *children_;
}

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (void)addMark:(id <Mark>)mark;
- (void)removeMark:(id <Mark>)mark;
- (id <Mark>)childMarkAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END

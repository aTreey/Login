//
//  Scribble.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/22.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "Scribble.h"
#import "Stroke.h"

@interface Scribble ()

/// 只供 Scribble 对象访问 Mark 属性
@property (nonatomic, strong) id<Mark> mark;

@end

@implementation Scribble

- (instancetype)init
{
    self = [super init];
    if (self) {
        // 父对象应该是个组合对象 (即Stroke)
        self.parentMark = [[Stroke alloc] init];
    }
    return self;
}

- (void)addMark:(id<Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark {
    
    // 手动调用KVO
    [self willChangeValueForKey:@"mark"];
    
    
    // 如果是YES，把mark添加到前一个mark作为聚合体的一部分
    // 根据设计，它应该是根节点的最后一个子节点
    if (shouldAddToPreviousMark) {
        [[self.parentMark lastChild] addMark:aMark];
    } else {
        // 否则把它添加到父节点
        [self.parentMark addMark:aMark];
    }
    
    
    // 手动调用KVO
    [self didChangeValueForKey:@"mark"];
}

- (void)removeMark:(id<Mark>)aMark {
    // 如果是父节点什么都不做
    if (aMark == self.parentMark) {
        return;
    }
    
    [self willChangeValueForKey:@"mark"];
    
    [self.parentMark removeMark:aMark];
    
    [self didChangeValueForKey:@"mark"];
}

@end

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

- (void)dealloc {
    
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCopy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    // 复制color，location 和size 都可以直接赋值给副本，但是color 需要使用CGColor 生成一个UIColor
    [dotCopy setColor:[UIColor colorWithCGColor:[color_ CGColor]]];
    // 复制size
    [dotCopy setSize:size_];
    return dotCopy;
}


@end

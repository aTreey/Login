//
//  EOCAnimatedView.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCAnimatedView.h"


/// 如果不打算公开常量，可以定义在实现文件里
static const NSTimeInterval kAnimationDuration = 0.3;

/// static 修饰意味着该变量仅在定义此变量的编译单元（实现文件.m）中可见，作用域就是当前.m文件
/// 如果需要声明一个外部可见的常值变量，需要在头文件中声明并使用 extern 关键词修饰 "extern NSString *const EOCStringConstant;
/// 常量解读是从右往左： const 修饰的是常量不希望别人修改， NSString * 指向NSString对象，

NSString *const EOCStringConstant = @"VALUE";

const NSTimeInterval EOCAnimatedViewAnimationDuration = 0.3;

NSTimeInterval const EOCAnimatedViewAnimationDuration1 = 0.3;


@implementation EOCAnimatedView


- (void)animate {
    
    [UIView animateWithDuration:EOCAnimatedViewAnimationDuration animations:^{
        // ...
    }];
    
    [UIView animateWithDuration:EOCAnimatedViewAnimationDuration1 animations:^{
        // ...
    }];
}

@end

////////////////////// 结论 /////////////
/// 1. 定义常量时static const定义编译单元（实现文件.m)中可见的常量，无需为其名称加前缀
/// 2. 在头文件中使用extern 声明全局常量，并在实现文件中定义其值，这种常量要出现在全局符号表中，所以加相关类作为前缀

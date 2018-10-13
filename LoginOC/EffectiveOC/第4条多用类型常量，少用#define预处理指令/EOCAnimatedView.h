//
//  EOCAnimatedView.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//



/// 编写代码时遇到的常量有时会用宏定义来处理
#define ANIMATION_DURATION 0.3
/// 缺点：
/**
 1. 可以把所有相同的字符串值都替换为定义的值，
 2. 定义出来的常量没有具体的类型信息
 3. 如果有人重新定义了宏定义，不会有警告或者提醒，导致程序中值不一样
 */

/// 解决方法：
// 使用类型常量，可以使常量有具体的类型
// 不应该在头文件中

/// 命名规则：
// 1. 如果只是在实现文件.m 中使用，则在前面加字母k
// 2. 如果此常量在类之外也可见，则以类名为前缀，（第19条详细了解命名习惯）


/// 声明位置：
///  1. 总是喜欢在头文件中声明宏定义，可能和常量名冲突，
///  2. 所有引入这个头文件的类都会出现宏定义或者常量，相当于声明了一个名叫kAnimationDuration的全局变量
///  3. 应该加上前缀，表明其所属的具体类，例如：EOCViewClassAnimationDuration



#import <UIKit/UIKit.h>


// 常量从右往左解读，具体类型，不可修改
extern NSString *const EOCStringConstant;
// 两者写法都可以
extern const NSTimeInterval EOCAnimatedViewAnimationDuration;
extern NSTimeInterval const EOCAnimatedViewAnimationDuration1;


@interface EOCAnimatedView : UIView

@end


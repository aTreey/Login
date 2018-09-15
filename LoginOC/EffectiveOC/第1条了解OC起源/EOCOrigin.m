//
//  EOCOrigin.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCOrigin.h"

@implementation EOCOrigin
/**
 - OC使用的是“消息结构”而不是“函数调用”
 两者区别看上去如这样：
     // 消息结构
     NSObject *objc = [NSObject new];
     [objc performWith: parameter1 and: parameter2];
 
     // 函数调用
     Object *objc = new Object;
     objc -> perform(parameter1, parameter2);
 
 关键区别：
    消息结构：在运行时所执行的代码由运行环境来决定，无论是否多态总会在运行时才会去查找所要执行的方法，
    函数调用：由编译器决定，如果函数多态，编译时就要查处到底应该执行那个函数实现
    消息结构中编译器不会关心接收消息的对象是何种类型，接收消息的对象问题也要在运行时处理，此过程叫做“动态绑定”
 
- OC 中对象总是分配在“堆空间”，而绝不会分配在”栈“上，不带 “*”的变量或者结构体等可能会使用“栈空间”
 */

- (void)origin {
}

@end

////////////////////// 结论 /////////////
/// 1. OC语言使用的动态绑定的消息结构，在运行时所执行的代码由运行环境来决定，无论是否多态总会在运行时才会去查找所要执行的方法，
/// 2. OC 中对象总是分配在“堆空间”，而绝不会分配在”栈“上，不带 “*”的变量或者结构体等可能会使用“栈空间”



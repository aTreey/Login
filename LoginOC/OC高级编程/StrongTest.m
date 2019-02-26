//
//  StrongTest.m
//  LoginOC
//
//  Created by HongpengYu on 2019/1/13.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "StrongTest.h"

@interface StrongTest ()


@end

@implementation StrongTest

- (instancetype)init {
    self = [super init];
    return self;
}

// __strong 修饰符表示对对象的“强引用”
- (void)setObject:(id __strong)obj {
    obj_ = obj;
}


@end

@implementation StrongCycleTest

- (void)test {
    
    /*
     * test0 持有Test 对象 A 的强引用
     */
    id test0 = [[StrongTest alloc] init]; // 对象A
    
    /*
     * test1 持有Test 对象 B 的强引用
     */
    id test1 = [[StrongTest alloc] init]; // 对象B
    
    
    [test0 setObject:test1];
    // 持有 Test对象B 的强引用 为obj_ 和 test1
    
    [test1 setObject:test0];
    
    // 持有 Test对象A 的强引用 为obj_ 和 test0
}

/*
 * test0 变量超出其作用域，强引用也失效， Test 对象 A 自动释放
 * test1 变量超出其作用域，强引用也失效,  Test 对象 B 自动释放
 *
 * 此时持有 Test 对象 A 的强应用的变量为 Test 对象 B 的 obj_
 * 此时持有 Test 对象 B 的强应用的变量为 Test 对象 A 的 obj_
 *
 *     发生了内存泄露
 */

#pragma mark -
#pragma mark - 相互强引用

- (void)strongCycle {
    id test = [[StrongTest alloc] init];
    [test setObject:test];
    /**以上也会出现循环引用， 只有一个对象，但在该对象持有其自身时*/
}

- (void)weakStrongCycle {
    
    ///  自己生成并持有对象的强应用
    id __strong obj0 = [[NSObject alloc] init]; // 对象 0
    
    /// 持有生成对象的弱引用
    id __weak obj1 = obj0;
}


/*
 * NSObject 对象 0 变量超出其作用域，强引用失效， NSObject 对象 A 自动释放
 * __weak 修饰的变量 obj1 弱引用不持有对象，所以 NSObject  对象 0 会销毁
 *
 *     不发生相互强引用
 */

@end



@implementation Unsafe_unRetainedTest


- (void)__unsafe_unretainedCodeBlock {
    
    id __unsafe_unretained obj1 = nil;
    
    {
        id __unsafe_unretained obj = [[NSObject alloc] init];
        
        // 自己生成并持有对象
        // 因为obj0 变量是__strong,强引用，所以自己持有对象
        id __strong obj0 = [[NSObject alloc] init];
        
        // obj0 变量赋值给你obj1
        // ojb1 变量不持有对象的强应用，也不持有弱引用
        obj1 = obj0;
        
        
        // 输出 obj1 变量表示的对象
        NSLog(@"A: %@", obj1);
    } // obj0变量 超出了其作用域，强引用失效自动释放自己持有的对象，除此之外没有其他持有者，所以废弃该对象
    
    
    
    
    // 输出 obj1 变量表示的对象
    // obj1 变量表示的对象因为无持有者已经销毁，坏的内存访问
    NSLog(@"B: %@", obj1);

}





@end

//
//  RunTimeObject.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/8.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "RunTimeObject.h"
#import <objc/runtime.h>

@implementation RunTimeObject


void testImp (void) {
    NSLog(@"test invoke");
}

+ (void)load {
    // 通过Runtime 获取方法的机构体
    Method test = class_getInstanceMethod(self, @selector(test));
    Method otherTest = class_getInstanceMethod(self, @selector(otherTest));
    
    // 交换两个方法实现
//    method_exchangeImplementations(test, otherTest);
}

//- (void)test {
//    NSLog(@"test");
//}
//
//- (void)otherTest {
//    // 因为发生了交换，不会形成死循环
//    [self otherTest];
//    NSLog(@"otherTest");
//}




// 实现消息转发流程 中的方法
/**
 是否要解决当前实例方法的实现
 */
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(test)) {
        NSLog(@"resolveInstanceMethod:");
        // 如果返回YES，消息转发就会结束
//        return YES;
        
        
        
        /**
         动态添加方法
         添加方法后应该返回 YES，
         */
        
        class_addMethod(self, @selector(test), testImp, "v@:");
        return YES;
        
        return NO;
        
    } else {
        
        NSLog(@"super resolveInstanceMethod:");
        // 返回父类的默认调用
        return [super resolveInstanceMethod:sel];
    }
}


/**
 - 参数是 SEL 方法选择器
 - 返回值是 id 类型，说明有哪个对象来处理，转发的对象是谁，如果返回了转发目标就会结束当前调用
 - 如果返回为nil，系统会调用 methodSignatureForSelector:方法，最后一次机会处理这个消息
 */
- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@" forwardingTargetForSelector: ");
    return nil;
}

/**
 - 参数是 SEL 方法选择器
 - 返回值是一个对象，实际上这个对象是对`methodSignatureForSelector` 方法的参数，参数个数，参数类型和返回值的包装
 - 如果返回一个方法签名的话，就会调用 forwardInvocation: 方法
 - 如果返回为nil，标记为消息无法处理，程序crash
 
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    if (aSelector == @selector(test)) {
        NSLog(@"methodSignatureForSelector:");
        /**
         v: 表示这个方法返回值是 void
         
         固定参数@: 表示参数类型是 id, 即self
         固定参数`:` : 表示参数类型是选择器类型，即 @selector(test)
         */
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    } else {
        
        NSLog(@"super methodSignatureForSelector:");
        // 返回父类的默认调用
        return [super methodSignatureForSelector:aSelector];
    }
}


- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation:");
}

@end

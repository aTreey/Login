//
//  KVO_Test.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/6.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "KVO_Test.h"

@implementation KVO_Test

- (instancetype)init {
    if (self) {
        _value = 0;
    }
    return self;
}


- (void)setValue:(NSInteger)value {
    NSLog(@"执行了 setValue:(NSInteger)value方法");
}


/**
 MRC下 Retain 修饰的属性setter 方法重写
 */
//- (void)setObj:(id)obj {
//    if (_obj != obj) {// 判断是为了防止异常处理，如果不做画if 判断，当传入的 obj 对象正好是原来的_obj 对象，对  原对象尽心releas 操作，实际上也会对传入的对象进行releas 操作进行释放，此时如果再通过obj指针访问废弃的对象时就会导致carsh
//        [_obj release];
//    }
//    _obj = [obj retain];
//
//}


- (void)increase {
    // 直接为成员变量赋值
    
    [self willChangeValueForKey:@"value"];
    _value += 1;
    [self didChangeValueForKey:@"value"];
}

- (void)test {
    
}


@end

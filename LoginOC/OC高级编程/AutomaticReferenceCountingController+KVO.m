//
//  AutomaticReferenceCountingController+KVO.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/6.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController+KVO.h"
#import "KVO_Test.h"
#import "KVO_Observer.h"

@implementation AutomaticReferenceCountingController (KVO)

- (void)kvo_test {
    KVO_Test *kvoObjc = [[KVO_Test alloc] init];
    KVO_Observer *observer = [[KVO_Observer alloc] init];

    
    NSLog(@"未使用kvo 时对象 kvoObjc 所属的类 class = %s", object_getClassName(kvoObjc));
    
    [kvoObjc addObserver:observer forKeyPath: @"value" options:NSKeyValueObservingOptionNew context:nil];
    
    NSLog(@"使用kvo 后对象 kvoObjc 所属的类kvoObjc class = %s", object_getClassName(kvoObjc));
//    kvoObjc.value = 1;
    

    // 1. 通过kvc 设置value 是否生效?
//    [kvoObjc setValue:@2 forKey:@"value"];r
    // 可以生效,因为执行了 setValue:(NSInteger)value 方法
    
    
    // 2. 通过成员变量直接复制value 是否生效？
    [kvoObjc increase];
    // 不能生效，因为不能够触发系统的KVO 机制，没有调用setValue 方法，
    // 但是value 的值确发生了变化，
    // 系统提供的KVO 想当于在 setter 方法中插入了2 个方法，willChangeValueForKey 和 didChangeValueForKey
    // 可以手动设置 KVO，在 实例方法中增加以上两行代码
    
    // 还可以使用 self.value 调用 setter 方法来能触发KVO 机制
    // increase 中的代码替换为：self.value += 1;
    
    
    /**
     isa 混写 技术说明
     未使用kvo 时对象 kvoObjc 所属的类 class = KVO_Test
     使用kvo 后对象 kvoObjc 所属的类kvoObjc class = NSKVONotifying_KVO_Test
     
     */
    
    
    [kvoObjc setValue:@3 forKey:@"value"];
//    [kvoObjc setValue:<#(nullable id)#> forUndefinedKey:<#(nonnull NSString *)#>];
}

@end

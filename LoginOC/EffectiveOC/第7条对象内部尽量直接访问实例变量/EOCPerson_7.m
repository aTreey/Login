//
//  EOCPerson_7.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/3.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson_7.h"
#import "EOCBrain.h"


@implementation EOCPerson_7


- (instancetype)init {
    if (self = [super init]) {
        
        self.brain;
        
        self.lastName = @"";
    }
    return self;
}

- (void)setLastName:(NSString *)lastName {
    _lastName = lastName;
//    self.lastName = lastName;
}

/**
 - 读取实例变量的时候应该采用直接访问形式，
 - 设置实例变量的时候通过属性的形式

 两种写法区别：
 
 */

- (NSString *)fullName {
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
    
    // 推荐写法：
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}

- (void)setFullName:(NSString *)fullName {
    NSArray *components = [fullName componentsSeparatedByString:@" "];
    self.firstName = [components objectAtIndex:0];
    self.lastName = [components objectAtIndex:1];
    
    // 推荐写法：
    _firstName = [components objectAtIndex:0];
    _lastName = [components objectAtIndex:1];
    
}

#pragma mark - 懒加载

- (EOCBrain *)brain {
    if (!_brain) {
        _brain = [EOCBrain new];
    }
    return _brain;
}

/**
 
两种写法区别：
 - 不经过 OC 的“方法派发”，直接访问实例变量的速度更快，编译器生成的代码会直接访问保存对象实例变量的那块内存
 - 直接访问实例变量时，不会调用“setter” 方法，绕过了为相关属性定义的“内存管理语义”，比如，在ARC 下直接访问一个声明为 copy 的属性， 并不会拷贝该属性，只会保留新值并释放旧值
 - 直接访问实例变量，不会触发”键值观测“机制，是否需要触发取决具体的对象行为
 - 有助于错误排查， 可以在 “setter” 方法和g“getter”方法中打断点，监控改属性的调用者和访问时机
 
 
 折中方案：
 
 写入实例变量时，通过其“setter“ 方法，读取变量时，直接访问

 优点：
 - 提高了读取操作的速度，又能控制属性的写入操作
 - 通过其“setter“ 方法设置实例变量原因在于能确保相关属性的”内存管理语义“ 得以贯彻
 
 注意点：
 
 - 在初始化方法中应该直接访问实例变量，因为子类有可能会 ”覆写“ 设置方法,
 
 假设 EOCPerson 有一个子类叫 EOCSmithPerson，覆写了 lastName 属性对应的设置方法， 在基类EOCPerson的默认初始化方法中，可能会将lastName 设置为空字符串，此时若是通过“setter”方法来做，调用的将会是子类的设置方法，从而抛出异常
 
 - 赖加载的属性需要调用“setter” 方法访问，否则永远不会初始化
 
 
 */



@end


////////////////////// 结论 /////////////
/// 1. 对象内读取数据，直接通过实例变量来读，写入数据时，通过设置方法 ”setter“ 设置
/// 2. 在 初始化方法 和 dealloc 方法中总是直接通过实例变量来读/写数据
/// 3. 赖加载的属性需要调用“setter” 方法访问，否则永远不会初始化

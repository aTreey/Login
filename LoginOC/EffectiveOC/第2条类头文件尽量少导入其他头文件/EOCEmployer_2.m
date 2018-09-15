//
//  EOCEmployer_2.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCEmployer_2.h"

@implementation EOCEmployer_2
- (void)addEmployee:(EOCEmployer_2 *)person {
    
}

- (void)removeEmployee:(EOCEmployer_2 *)person {
    
}
@end


////////////////////// 结论 /////////////
/// 1. 除非必要，否则不要引入头文件，使用向前声明降低类之间的耦合
/// 2. 有时无法使用向前声明，应该把该类遵守协议的声明放到“class-continuation分类”（匿名分类）中。
/// 3. 如果“class-continuation分类”也不行的话，就把协议单独放在一个文件中，再将其引入

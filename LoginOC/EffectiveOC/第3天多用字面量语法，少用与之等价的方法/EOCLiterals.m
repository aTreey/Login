//
//  EOCLiterals.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCLiterals.h"

@implementation EOCLiterals
- (void)tempMethond {
    // OC1.0 起，支持简单方式创建基本类型对象
    
    // - 使用字符串字面量：简介易读
    NSString *someString = @"Effective Objective-C 2.0";
    // 传统方式
    NSString *someStrongOld = [NSString stringWithFormat:@"Effective Objective-C 2.0"];
    
    
    // - 字面数值
    NSNumber *someNumber = @1;
    NSNumber *floatNumber = @2.5f;
    NSNumber *doubleNumber = @3.1415926;
    NSNumber *boolNumber = @YES;
    NSNumber *charNumber = @'a';
    // 字面量语法用于表达式
    int x = 5;
    float y = 6.23f;
    NSNumber *expressionNumber = @(x * y);
    
    
    // - 字面量数组
    NSArray *animals = @[@"cat", @"dog", @"mouse", @"badger"];
    NSString *dog = animals[1];
    
    // arrayWithObjects 和 字面量 的区别:
    // arrayWithObjects 方法依次处理各个参数，直到发现nil为止
    // 字面量数组遇到nil直接抛出异常
    NSArray *animalsOld = [NSArray arrayWithObjects:@"cat", @"dog", @"mouse", @"badger", nil];
    NSString *dogOld = [animalsOld objectAtIndex:1];
    
    
    // - 字面量字典
    // 如果有nil直接抛出异常
    NSDictionary *personData = @{@"firtName": @"Matt",
                                 @"lastName": @"Galloway",
                                 @"age": @28};
    NSString *lastName = personData[@"lastName"];
    
    // dictionaryWithObjectsAndKeys 方法依次处理各个参数，直到发现nil为止
    NSDictionary *personDataOld = [NSDictionary dictionaryWithObjectsAndKeys:@"Matt",@"firtName",
                                     @"Galloway", @"lastName",
                                     [NSNumber numberWithInteger:28], @"age", nil];
    
    NSString *lastNameOld = [personData objectForKey:@"lastName"];
    
    
    // - 可变数组和字典
    NSMutableArray *mutableArray = animals.mutableCopy;
    mutableArray[1] = @"dog";
    
    NSMutableDictionary *mutableDict = [personData mutableCopy];
    mutableDict[@"lastName"] = @"Galloway";
}
@end

////////////////////// 结论 /////////////
/// 1. 使用字面量语法创建字符串，数值，数组，字典简明扼要
/// 2. 通过下标操作获取数组，字典对应的元素
/// 3. 使用字面量创建数组，字典时若有nil ，会抛出异常，确保值里不含nil

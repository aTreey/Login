//
//  Prototype_bussiness.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Prototype_bussiness.h"
#import "Prototype_Student.h"
#import "Prototype_CopyObject.h"
#import "Prototype_CopyObject2.h"


@implementation Prototype_bussiness

- (void)bussiness {
    // 未使用设计模式用法
    Prototype_Student *student = [[Prototype_Student alloc] init];
    student.name = @"张三";
    student.age = @(20);
    student.address = @"张三的地址";
    student.totalScore = @(100);
    
    Prototype_Student *student2 = [[Prototype_Student alloc] init];
    student2.name = @"李四";
    student2.age = @(18);
    student2.address = @"李四的地址";
    student2.totalScore = @(50);
}

- (void)prototype_bussiness {
    // 1. 对象遵守制定的复制协议
    
    // 2. 实现协议中方法
    
    // 3. 调用对象协议中方法创建对象
    Prototype_Student *student = [[Prototype_Student alloc] init];
    student.name = @"张三";
    student.age = @(20);
    student.address = @"张三的地址";
    student.totalScore = @(100);
    
    Prototype_Student *student2 = [student clone];
    student2.name = @"李四";
    
    NSLog(@"student ==== %@, student2 ==== %@", student, student2);
    
    
    // copy
    Prototype_CopyObject2 *obj = [[Prototype_CopyObject2 alloc] init];
    obj.name = @"张三Copy";
    obj.objs = @[student, student2];
    
    // copyObj2数组中的对象是浅拷贝，需要使用[[NSArray alloc] initWithArray:self.objs copyItems:YES]做深拷贝;
    Prototype_CopyObject2 *copyObj2 = [student copy];
    
    NSLog(@"student ==== %@, student2 ==== %@", student, student2);
}


@end

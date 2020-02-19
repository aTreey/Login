//
//  Person_Prototype.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/21.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "Person_Prototype.h"

@implementation Person_Prototype

/**
 使用[self class]的原因是让子类也能调用此方法。不过，当子类有其他属性时，则需要注意。
 
 */

- (id)copyWithZone:(NSZone *)zone {
    Person_Prototype *p = [[[self class] allocWithZone:zone] init];
    p.name = self.name;
    p.age = self.age;
    return p;
}


+ (void)test {
    
    Person_Prototype *p1 = [[Person_Prototype alloc] init];
    p1.name = @"name1";
    p1.age = 29;
    
    Person_Prototype *p2 = [p1 copy];
    NSLog(@"%@:%@, %zd", p1, p1.name, p1.age);
    NSLog(@"%@:%@, %zd", p2, p2.name, p2.age);
}

@end


@implementation Student_Prototype

+ (void)test {
    Student_Prototype *s1 = [[Student_Prototype alloc] init];
    s1.name = @"s";
    s1.age = 15;
    s1.address = @"beijing";
    s1.size = CGSizeMake(175, 65);
    
    Student_Prototype *s2 = [s1 copy];
    
    // Student可以调用其父类Person的copyWithZone实现，但是由于address属性并没有被赋值，所以copy出来的实例address为null
    // <Student_Prototype: 0x60000183f0f0>:s, 15, beijing, {175, 65}
    // <Student_Prototype: 0x60000183f420>:s, 15, (null), {0, 0}
    
    NSLog(@"%@:%@, %zd, %@, %@", s1, s1.name, s1.age, s1.address, NSStringFromCGSize(s1.size));
    NSLog(@"%@:%@, %zd, %@, %@", s2, s2.name, s2.age, s2.address, NSStringFromCGSize(s2.size));
}

@end

// ========================================================================================================
//  ============ 为了 Student实现copyWithZone方法，然后重新把属性全部赋值一遍？这样不够优雅。框架级别的实现 =============
// ========================================================================================================

@implementation BaseCopyObject

// 子类不要重载这个方法
- (id)copyWithZone:(NSZone *)zone {
    BaseCopyObject *object = [[[self class] allocWithZone:zone] init];
    [self copyOperationWithObject:object];//赋值操作
    return object;
}

// 子类实现此方法，实现赋值操作
- (void)copyOperationWithObject:(id)object { }

@end


@implementation Person_Prototype1

- (void)copyOperationWithObject:(Person_Prototype1 *)object {
    object.name = self.name;
    object.age = self.age;
}

+ (void)test {
    Person_Prototype1 *p1_1 = [[Person_Prototype1 alloc] init];
    p1_1.name = @"name1";
    p1_1.age = 29;
    
    Person_Prototype1 *p1_2 = [p1_1 copy];
    
    NSLog(@"%@:%@, %zd", p1_1, p1_1.name, p1_1.age);
    NSLog(@"%@:%@, %zd", p1_2, p1_2.name, p1_2.age);
}

@end


@implementation Student_Prototype1

- (void)copyOperationWithObject:(Student_Prototype1 *)object {
    // 调用父类的属性赋值
    [super copyOperationWithObject:object];
    object.address = self.address;
    object.size = self.size;
    
    object.teacher = [self.teacher copy];
    
   
    object.friends = self.friends;
    // 两种写法都不能实现 “真正” 的copy
    // object.friends = [self.friends copy];
    // object.girlfriends = [self.girlfriends mutableCopy];
    
    object.friends = [[NSArray alloc] initWithArray:self.friends copyItems:YES];
    object.girlfriends = [[NSMutableArray alloc] initWithArray:self.girlfriends copyItems:YES];
    
    
}

+ (void)test {
    Student_Prototype1 *s1_1 = [[Student_Prototype1 alloc] init];
    s1_1.name = @"s";
    s1_1.age = 15;
    s1_1.address = @"beijing";
    s1_1.size = CGSizeMake(175, 65);
    
    Student_Prototype1 *s2_1 = [s1_1 copy];
    
    // Student可以调用其父类Person的copyWithZone实现，但是由于address属性并没有被赋值，所以copy出来的实例address为null
    // <Student_Prototype: 0x60000183f0f0>:s, 15, beijing, {175, 65}
    // <Student_Prototype: 0x60000183f420>:s, 15, (null), {0, 0}
    
    NSLog(@"%@:%@, %zd, %@, %@", s1_1, s1_1.name, s1_1.age, s1_1.address, NSStringFromCGSize(s1_1.size));
    NSLog(@"%@:%@, %zd, %@, %@", s2_1, s2_1.name, s2_1.age, s2_1.address, NSStringFromCGSize(s2_1.size));
}

@end

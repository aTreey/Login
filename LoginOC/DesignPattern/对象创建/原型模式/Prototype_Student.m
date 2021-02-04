//
//  Prototype_Student.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Prototype_Student.h"

@implementation Prototype_Student

- (nonnull id)clone {
    // 使用self class 初始化，防止被继承
    Prototype_Student *objc = [[[self class] alloc] init];
    objc.name = self.name;
    objc.age = self.age;
    objc.address = self.address;
    objc.totalScore = self.totalScore;
    return objc;
}

@end

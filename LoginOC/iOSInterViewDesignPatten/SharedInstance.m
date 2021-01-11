//
//  SharedInstance.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "SharedInstance.h"

/// 严格意义的单利写法
@implementation SharedInstance

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static SharedInstance *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

// 通过alloc创建对象
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return self;
}

@end

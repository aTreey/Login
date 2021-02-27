//
//  UserInfoManagerCenter.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/25.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "UserInfoManagerCenter.h"

/// 严格单利实现
/// 1. 防止子类继承
/// 2. alloc init 创建

/// NSCoding FastVCoder 

@implementation UserInfoManagerCenter

+ (instancetype)userManager {
    
    return self;
}

@end

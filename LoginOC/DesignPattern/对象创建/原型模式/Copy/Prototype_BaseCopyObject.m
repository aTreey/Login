//
//  Prototype_BaseCopyObject.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Prototype_BaseCopyObject.h"

@implementation Prototype_BaseCopyObject

- (id)copyWithZone:(NSZone *)zone {
    Prototype_BaseCopyObject *obj = [[self class] allocWithZone:zone];
    // 赋值操作
    
    return obj;
}

- (void)copyOperationWithObj:(id)obj {
    
}

@end

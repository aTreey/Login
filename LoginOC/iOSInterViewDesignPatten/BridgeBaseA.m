//
//  BridgeBaseA.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "BridgeBaseA.h"
#import "BridgeBaseB.h"

@implementation BridgeBaseA

- (void)handle {
    // 由具体的子类去实现
    
    // 也可以有默认实现
    [self.objB fetchData];
}

@end

//
//  BridgeDemo.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "BridgeDemo.h"

#import "BridgeA1.h"
#import "BridgeA2.h"

#import "BridgeB1.h"
#import "BridgeB2.h"


@interface BridgeDemo ()

// 持有抽象的对象A
@property (nonatomic, strong) BridgeBaseA *objA;

@end

@implementation BridgeDemo

/**
 根据实际业务加载不同数据
 A1 ---> B1、B2
 A2 ---> B1、B2
 
 */

- (void)fetch {
    // 具体对象A
    self.objA = [[BridgeA1 alloc] init];
    
    // 具体对象B
    BridgeBaseB *objB1 = [[BridgeB1 alloc] init];
    self.objA.objB = objB1;
    
    [self.objA handle];
}

@end

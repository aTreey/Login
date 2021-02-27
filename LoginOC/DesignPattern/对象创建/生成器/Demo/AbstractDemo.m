//
//  AbstractDemo.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/5.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "AbstractDemo.h"
#import "Engine.h"
#import "Wheel.h"
#import "Door.h"
#import "Builder.h"

@interface AbstractDemo ()

/// 组装者
@property (nonatomic, strong) Builder *builder;

@end

@implementation AbstractDemo

- (void)bussiness {
    Builder *builder = [[Builder alloc] init];
    self.builder = builder;
    builder.engine = [[Engine alloc] init];
    builder.wheel = [[Wheel alloc] init];
    builder.door = [[Door alloc] init];
    
    [builder buildAllParts];
}

@end

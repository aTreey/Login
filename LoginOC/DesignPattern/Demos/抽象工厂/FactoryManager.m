//
//  FactoryManager.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/1.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "FactoryManager.h"
#import "AppleFactory.h"
#import "GoogleFactory.h"

@implementation FactoryManager

+ (BaseFactory *)factoryWithType:(FactoryType)type {
    BaseFactory *factory = nil;
    switch (type) {
        case FactoryTypeApple:
            factory = [[AppleFactory alloc] init];
            break;
        case FactoryTypeGoogle:
            factory = [[GoogleFactory alloc] init];
            break;
    }
    return factory;
}

@end

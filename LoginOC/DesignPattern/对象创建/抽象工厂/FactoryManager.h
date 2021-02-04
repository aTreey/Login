//
//  FactoryManager.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/1.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseFactory.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FactoryType) {
    FactoryTypeApple,
    FactoryTypeGoogle
};

@interface FactoryManager : NSObject

+ (BaseFactory *)factoryWithType:(FactoryType)type;

@end

NS_ASSUME_NONNULL_END

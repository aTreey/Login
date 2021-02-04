//
//  BaseFactory.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/1.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BasePhone.h"
#import "BaseWatch.h"

NS_ASSUME_NONNULL_BEGIN

/// 抽象类，不能调用实例方法
@interface BaseFactory : NSObject

- (BasePhone *)creatPhone;
- (BaseWatch *)creatWatch;

@end

NS_ASSUME_NONNULL_END

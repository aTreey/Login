//
//  AapterObj.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AdapterTarget;

NS_ASSUME_NONNULL_BEGIN

/// 适配对象
@interface AapterObj : NSObject

/// 被适配对象
@property (nonatomic, strong) AdapterTarget *target;

/// 对原有方法包装
- (void)request;

@end

NS_ASSUME_NONNULL_END

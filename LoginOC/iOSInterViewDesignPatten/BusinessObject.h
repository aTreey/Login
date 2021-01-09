//
//  BusinessObject.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BusinessObject;


typedef void(^CompletionBlock)(BOOL handled);
typedef void(^ResultBlock)(BusinessObject * _Nullable handler, BOOL handled);

NS_ASSUME_NONNULL_BEGIN

/// 责任链模式
@interface BusinessObject : NSObject

/// 下一个响应者
@property (nonatomic, strong) BusinessObject *nextBusiness;

/// 响应者处理方法
/// @param result 结果
- (void)handle:(ResultBlock)result;

/// 各个业务在该方法中做实际业务处理
/// @param completion 完成回调
- (void)handleBusiness:(CompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END

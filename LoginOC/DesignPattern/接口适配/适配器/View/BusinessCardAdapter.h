//
//  BusinessCardAdapter.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCardAdapterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

/// 适配器抽象类，需要遵守协议
@interface BusinessCardAdapter : NSObject <BusinessCardAdapterProtocol>

/// 输入的对象
@property (nonatomic, weak) id data;

/// 于输入的对象建立关系
/// @param data 输入的数据
- (instancetype)initWithData:(id)data;

@end

NS_ASSUME_NONNULL_END

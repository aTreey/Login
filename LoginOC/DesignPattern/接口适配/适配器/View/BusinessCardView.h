//
//  BusinessCardView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCardAdapterProtocol.h"

@class NormalModel;

NS_ASSUME_NONNULL_BEGIN

@interface BusinessCardView : UIView

/**
 *  名字
 */
@property (nonatomic,   copy) NSString *name;

/**
 *  线条颜色
 */
@property (nonatomic, strong) UIColor  *lineColor;

/**
 *  电话号码
 */
@property (nonatomic,   copy) NSString *phoneNumber;


/// 数据模型
- (void)loadDataWithModel:(NormalModel *)model;


/// 使用适配器模式
/// @param data 遵守BusinessCardAdapterProtocol协议的model
- (void)loadData:(id<BusinessCardAdapterProtocol>)data;

@end

NS_ASSUME_NONNULL_END

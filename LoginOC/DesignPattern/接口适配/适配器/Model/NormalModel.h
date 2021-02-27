//
//  NormalModel.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NormalModel : NSObject

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


+ (NormalModel *)model;

@end

NS_ASSUME_NONNULL_END

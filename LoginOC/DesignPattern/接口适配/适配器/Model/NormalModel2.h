//
//  NormalModel2.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/// 另一种model
@interface NormalModel2 : NSObject

/**
 *  名字
 */
@property (nonatomic, strong) NSString *name;

/**
 *  线条颜色, 跟 normalModel 有区别
 */
@property (nonatomic, strong) NSString *colorString;

/**
 *  电话号码
 */
@property (nonatomic, strong) NSString *phoneNumber;

+ (NormalModel2 *)model;

@end

NS_ASSUME_NONNULL_END

//
//  EOCEmployee.h
//  LoginOC
//
//  Created by HongpengYu on 2018/10/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, EOCEmployeeType) {
    EOCEmployeeTypeDeveloper,
    EOCEmployeeTypeDesigner,
    EOCEmployeeTypeFinance,
};

// 基类
NS_ASSUME_NONNULL_BEGIN
@interface EOCEmployee : NSObject
@property (copy) NSString *name;
@property NSUInteger salary;

// 提供一个类方法提供创建不同类别的雇员（工厂方法）
+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type;
- (void)doADaysWork;
@end
NS_ASSUME_NONNULL_END

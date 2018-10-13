//
//  EOCEmployee.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCEmployee.h"
#import "EOCEmployeeFinance.h"
#import "EOCEmployeeDesigner.h"
#import "EOCEmployeeDeveloper.h"



@implementation EOCEmployee

+ (EOCEmployee *)employeeWithType:(EOCEmployeeType)type {
    switch (type) {
        case EOCEmployeeTypeDeveloper:
            return [EOCEmployeeDeveloper new];
            break;
            
        case EOCEmployeeTypeDesigner:
            return [EOCEmployeeDesigner new];
            break;
            
        case EOCEmployeeTypeFinance:
            return [EOCEmployeeFinance new];
            break;
    }
}

- (void)doADaysWork {
    // 子类实现此方法
}



@end

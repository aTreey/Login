//
//  NormalModel2.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "NormalModel2.h"

@implementation NormalModel2

+ (NormalModel2 *)model {
    NormalModel2 *normalModel = [[NormalModel2 alloc] init];
    normalModel.name = @"王经理";
    normalModel.colorString = @"orange";
    normalModel.phoneNumber = @"1232454657";
    return normalModel;
}

@end

//
//  NormalModelAdapter.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "NormalModelAdapter.h"
#import "NormalModel.h"

@implementation NormalModelAdapter

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {
    NormalModel *model = self.data;
    return model.name;
}

- (UIColor *)lineColor {
    NormalModel *model = self.data;
    return model.lineColor;
}

- (NSString *)phoneNumber {
    NormalModel *model = self.data;
    return model.phoneNumber;
}

@end

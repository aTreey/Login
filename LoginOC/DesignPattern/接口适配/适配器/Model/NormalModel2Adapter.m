//
//  NormalModel2Adapter.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/28.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "NormalModel2Adapter.h"
#import "NormalModel2.h"

@implementation NormalModel2Adapter

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {
    NormalModel2 *model = self.data;
    return model.name;
}

- (UIColor *)lineColor {
    NormalModel2 *model = self.data;
    
    // 适配器需要解决的问题
    UIColor *color = nil;
    if ([model.colorString isEqualToString:@"orange"]) {
        color = [UIColor orangeColor];
    } else {
        color = [UIColor blueColor];
    }
    return color;
}

- (NSString *)phoneNumber {
    NormalModel2 *model = self.data;
    return model.phoneNumber;
}

@end

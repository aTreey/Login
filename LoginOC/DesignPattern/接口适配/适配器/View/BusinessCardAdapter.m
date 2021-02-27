//
//  BusinessCardAdapter.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "BusinessCardAdapter.h"

@implementation BusinessCardAdapter

- (instancetype)initWithData:(id)data {
    if (self = [super init]) {
        self.data = data;
    }
    return self;
}

- (NSString *)name {
    return nil;
}

- (UIColor *)lineColor {
    return nil;
}

- (NSString *)phoneNumber {
    return nil;
}

@end

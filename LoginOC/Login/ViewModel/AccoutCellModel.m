//
//  AccoutCellModel.m
//  LoginOC
//
//  Created by yhp on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "AccoutCellModel.h"


@implementation AccoutCellModel

- (instancetype)initWithTips:(NSString *)tips placeholder:(NSString *)placeholder {
    if (self = [super init]) {
        self.tips = tips;
        self.placeholder = placeholder;
    }
    return self;
}

@end

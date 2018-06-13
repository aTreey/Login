//
//  LoginButtonCellModel.m
//  LoginOC
//
//  Created by liepin on 2018/3/27.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginButtonCellModel.h"

@implementation LoginButtonCellModel

- (instancetype)initWithTite:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)cornerRadius height:(CGFloat)height {
    if (self = [super init]) {
        self.title = title;
        self.titleColor = titleColor;
        self.backgroundColor = backgroundColor;
        self.cornerRadius = cornerRadius;
        self.height = height;
    }
    return self;
}

@end

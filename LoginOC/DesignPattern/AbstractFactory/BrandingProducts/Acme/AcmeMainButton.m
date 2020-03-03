//
//  AcmeMainButton.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "AcmeMainButton.h"

@implementation AcmeMainButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setTitle:@"Acme" forState:UIControlStateNormal];
    }
    return self;
}

@end

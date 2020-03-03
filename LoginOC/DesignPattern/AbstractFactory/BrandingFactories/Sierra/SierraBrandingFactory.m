//
//  SierraBrandingFactory.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "SierraBrandingFactory.h"
#import "SierraView.h"
#import "SierraMainButton.h"
#import "SierraToolbar.h"

@implementation SierraBrandingFactory

- (UIView *)brandedView {
    return [[SierraView alloc] init];
}

- (UIButton *)brandedMainButton {
    return [[SierraMainButton alloc] init];
}

- (UIToolbar *)brandedToolbar {
    return [[SierraToolbar alloc] init];
}

@end

//
//  AcmeBrandingFactory.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "AcmeBrandingFactory.h"
#import "AcmeView.h"
#import "AcmeMainButton.h"
#import "AcmeToolbar.h"

@implementation AcmeBrandingFactory

- (UIView *)brandedView {
    return [[AcmeView alloc] init];
}

- (UIButton *)brandedMainButton {
    return [[AcmeMainButton alloc] init];
}

- (UIToolbar *)brandedToolbar {
    return [[AcmeToolbar alloc] init];
}

@end

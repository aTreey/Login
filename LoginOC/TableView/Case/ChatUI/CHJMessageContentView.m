//
//  CHJMessageContentView.m
//  LoginOC
//
//  Created by YuHongpeng on 2019/6/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CHJMessageContentView.h"

@implementation CHJMessageContentView

- (instancetype)init {
    if (self = [super init]) {
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.fillColor = [UIColor grayColor].CGColor;
        maskLayer.contentsCenter = CGRectMake(.7f, .7f, .1f, .1f);
        maskLayer.contentsScale = [UIScreen mainScreen].scale;
        self.layer.mask = maskLayer;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.maskView.frame = CGRectInset(self.bounds, 0, 0);
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.layer.mask.frame = CGRectInset(self.bounds, 0, 0);
    [CATransaction commit];
}

@end

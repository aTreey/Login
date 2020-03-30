//
//  SetStrokeColorCommand.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/10.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "SetStrokeColorCommand.h"
#import "CoordinatingController.h"
#import "CanvasViewController.h"


@implementation SetStrokeColorCommand

- (void)execute {
    CGFloat redValue = 0.0;
    CGFloat greenValue = 0.0;
    CGFloat blueValue = 0.0;
    
    /**
     代理实现一
     */
    // 从委托取得RGB值
    [self.delegate command:self didRequestColorComponentsForRed:&redValue green:&greenValue blue:&blueValue];
    
    
    /**
     block 实现二
     */
    if (self.RGBValuesProvider) {
        self.RGBValuesProvider(&redValue, &greenValue, &blueValue);
    }
    
    
    // 根据RGB创建一个color对象
    UIColor *color = [UIColor colorWithRed:redValue green:greenValue blue:blueValue alpha:1.0];
    // 赋值给当前canvasViewController
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = coordinator.canvasViewController;
    controller.strokeColor = color;
    
    
    // 转发更新成功消息
    [self.delegate command:self didFinishColorUpdateWithColor:color];
    
    if (self.postColorUpdateProvider) {
        self.postColorUpdateProvider(color);
    }
}

@end

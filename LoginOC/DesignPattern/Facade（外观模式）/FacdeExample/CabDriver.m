//
//  CabDriver.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/15.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "CabDriver.h"
#import "Taximeter.h"
#import "Car.h"


@implementation CabDriver

- (void)driveToLocation:(CGPoint)location {
    
    // 初始化计价器，启动
    Taximeter *meter = [[Taximeter alloc] init];
    [meter start];
    
    // car 对象详细操作
    Car *car = [[Car alloc] init];
    [car releaseBrakes];
    [car changeGears];
    [car pressAccelerator];
    
    
    // 到达目的地，停车，停止计价器
    [car releaseAccelerator];
    [car pressBrakes];
    [meter stop];
}

@end

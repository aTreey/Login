//
//  EOCEnum.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/19.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCEnum.h"

@implementation EOCEnum

- (void)testEnum {
    // 未使用typedef 关键字
    enum EOCConnectionState status = EOCConnectionStateConnected;
    NSLog(@"%u", status);
    
    // 使用typedef 关键字
    EOCConnectionState status1 = EOCConnectionStateConnecting;
    NSLog(@"%u", status1);
    
    UIViewAutoresizing resizing = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    if (resizing & UIViewAutoresizingFlexibleWidth) {
        // 设置了 UIViewAutoresizingFlexibleWidth 约束
    }
}

// UIKit 试图所支持的设置显示方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft;
}

// 7. 枚举使用

- (void)userEnum {
    switch (_state3) {
        case EOCConnectionState3DisConnected:
            // ...
            break;
            
        case EOCConnectionState3DisConnecting:
            // ...
            break;
            
        case EOCConnectionState3Connected:
            // ...
            break;
            
        default: // 最好不用，防止以后增加一种状态机之后，编译器不发出警告
            break;
    }
}

@end


////////////////////// 结论 /////////////
/// 1. 使用枚举表示状态机的状态、传递给方法的选项以及状态码等值，给枚举值起名时要注重易懂
/// 2. 如果一个类型可以使用状态机的状态来表示，并且多个选项可同时使用，那么就定义为可选的枚举类型，枚举各值定义为2的幂，以便通过“按位或”操作组合
/// 3. 使用NS_ENUM 和 NS_OPTIONS 宏来定义枚举，并指明底层的数据类型。这样可以确保枚举是用开发者所选的底层数据类型实现出来的，而不会采用编译器所选的类型
/// 4. switch语句处理枚举类型时不要实现default 分支，如果以后加入枚举的新状态之后，编译器会发出警告

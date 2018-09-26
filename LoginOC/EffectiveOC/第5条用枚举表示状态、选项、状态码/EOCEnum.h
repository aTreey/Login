//
//  EOCEnum.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/19.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

// 1. 套接字链接枚举
enum EOCConnectionState {
    EOCConnectionStateDisconnected, // 断开连接
    EOCConnectionStateConnecting,   // 连接中...
    EOCConnectionStateConnected,    // 已连接
};

// 以上枚举如果要使用如下：
// enum EOCConnectionState status = EOCConnectionStateConnected;


// 如果每次都不需要输入enum关键字，只需要typedef关键字重新定义枚举类型
// EOCConnectionState status1 = EOCConnectionStateConnecting;

typedef enum EOCConnectionState EOCConnectionState;


// 2. 设置枚举的初始值

enum EOCConnectionStateConnectionState {
    EOCConnectionStateConnectionStateDisconnected = 1, // 断开连接
    EOCConnectionStateConnectionStateConnecting,   // 连接中...
    EOCConnectionStateConnectionStateConnected,    // 已连接
};

/// 3. 可组合枚举，UIKit 中
//enum UIViewAutoresizing {
//    UIViewAutoresizingNone                 = 0,
//    UIViewAutoresizingFlexibleLeftMargin   = 1 << 0,
//    UIViewAutoresizingFlexibleWidth        = 1 << 1,
//    UIViewAutoresizingFlexibleRightMargin  = 1 << 2,
//    UIViewAutoresizingFlexibleTopMargin    = 1 << 3,
//    UIViewAutoresizingFlexibleHeight       = 1 << 4,
//    UIViewAutoresizingFlexibleBottomMargin = 1 << 5
//}

// << 位操作符(左移)， 表示往左移动N位，使用 位运算符 | (或)来组合使用
// 使用位运算符 &（与） 判断是否开启了某个选项



// 4. 使用宏定义枚举
// 普通枚举类型（老式语法定义枚举）
typedef enum : NSUInteger {
    EOCConnectionState2DisConnected,
    EOCConnectionState2DisConnecting,
    EOCConnectionState2Connected,
} EOCConnectionState2;

// 5. 定义新特性枚举
typedef NS_ENUM(NSUInteger, EOCConnectionState3) {
    EOCConnectionState3DisConnected,
    EOCConnectionState3DisConnecting,
    EOCConnectionState3Connected,
};


// NS_ENUM 宏定义的枚举展开后：
typedef enum EOCConnectionState_3 : NSUInteger EOCConnectionState_3;
enum EOCConnectionState_3 : NSUInteger {
    EOCConnectionState_3DisConnected,
    EOCConnectionState_3DisConnecting,
    EOCConnectionState_3Connected,
};


// 6. 可多选枚举
typedef NS_OPTIONS(NSUInteger, EOCPermittedDirection) {
    EOCPermittedDirectionUp = 1 << 0,
    EOCPermittedDirectionDown = 1 << 1,
    EOCPermittedDirectionLeft = 1 << 2,
};



@interface EOCEnum : NSObject

@property (nonatomic, assign) enum EOCConnectionState state;

@property (nonatomic, assign) EOCConnectionState3 state3;

@end




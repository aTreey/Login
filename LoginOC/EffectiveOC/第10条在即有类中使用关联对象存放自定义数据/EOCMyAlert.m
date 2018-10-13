//
//  EOCMyAlert.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCMyAlert.h"
#import <objc/runtime.h>

@implementation EOCMyAlert
- (void)askUserAQuestion {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    [alert show];
}

#pragma mark - 代理方法
/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        // ...
    } else {
        // ...
    }
}

 */


// 一个类中处理多个警告试图存在的问题
/**
- 代码复杂，
- 需要在代理方法判断传入的参数区分不同的alert 试图
 */

// 创建试图时就把处理每个按钮的逻辑都写好，通过关联对象解决
/**
 创建完试图后，设定一个与之关联的“块”，等到执行 delegate 的时候再读出来
 将创建 试图代码 和 处理操作代码 放在了一起
 */

static void *EOCMyAlertViewKey = "EOCMyAlertViewKey";

- (void)askUserAQuestion_assoctitonValue {
    // 创建试图代码
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Question" message:@"What do you want to do？" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Continue", nil];
    
    // 处理操作代码
    void (^block)(NSInteger) = ^(NSInteger buttonIndex) {
        if (buttonIndex == 0) {
            // ...
        } else {
            // ...
        }
    };
    
    objc_setAssociatedObject(alert, EOCMyAlertViewKey, block, OBJC_ASSOCIATION_COPY);
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    void (^block)(NSInteger) = objc_getAssociatedObject(alertView, EOCMyAlertViewKey);
    block(buttonIndex);
}

@end

////////////////////// 结论 /////////////
/// 1. 可通过“关联对象”机制来把两个对象连接起来
/// 2. 关联时需要指定内存管理语义
/// 3. 只有其他做法都不可行的时候使用，轻易不要使用此方法，可能会导致难以排查的bug

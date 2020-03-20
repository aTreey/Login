//
//  CoordinatingController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/10.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasViewController.h"

NS_ASSUME_NONNULL_BEGIN

/// 单例实例起中介者作用，协调应用程序中的各个视图控制器
@interface CoordinatingController : NSObject

@property (nonatomic, readonly) CanvasViewController *canvasViewController;

+ (CoordinatingController *) sharedInstance;

@end

NS_ASSUME_NONNULL_END

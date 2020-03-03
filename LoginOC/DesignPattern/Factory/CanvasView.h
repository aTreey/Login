//
//  CanvasView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/19.
//  Copyright © 2019 HongpengYu. All rights reserved.
//  画布类

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 作为最上层的抽象类 供控制器使用，以消除与返回的特定CanvasView 的耦合，
/// 用子类来扩展他，
/// 它的实例由CanvasViewGenerator 抽象类中定义的工厂方法 canvasViewWithFrame: 来创建
@interface CanvasView : UIView

@end

NS_ASSUME_NONNULL_END

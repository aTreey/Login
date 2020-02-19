//
//  CanvasViewGenerator.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/12/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CanvasView.h"


NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewGenerator : NSObject

// 默认实现，创建并返回无图案的CanvasView
// 子类需要重载这个方法，返回具体的类型
- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame;

@end

NS_ASSUME_NONNULL_END

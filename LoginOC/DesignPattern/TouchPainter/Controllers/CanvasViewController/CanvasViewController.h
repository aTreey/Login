//
//  CanvasViewController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/19.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

/**
 使用画布
 */
#import "CanvasView.h"
#import "CanvasViewGenerator.h"
#import "Scribble.h"


NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewController : UIViewController
@property (nonatomic, strong, readonly) Scribble *scribble;
@property (nonatomic, strong) CanvasView *canvasView;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGFloat strokeSize;


/// 加载画布
/// @param generator 画布生成器
- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end

NS_ASSUME_NONNULL_END

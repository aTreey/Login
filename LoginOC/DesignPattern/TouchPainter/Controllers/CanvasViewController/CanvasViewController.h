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


NS_ASSUME_NONNULL_BEGIN

@interface CanvasViewController : UIViewController

@property (nonatomic, strong) CanvasView *canvasView;
@property (nonatomic, strong) UIColor *strokeColor;


/// <#Description#>
/// @param generator <#generator description#>
- (void)loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end

NS_ASSUME_NONNULL_END

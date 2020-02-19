//
//  PaperCanvasViewGenerator.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/12/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"

@implementation PaperCanvasViewGenerator

- (CanvasView *)canvasViewWithFrame:(CGRect)aFrame {
    return [[PaperCanvasView alloc] initWithFrame:aFrame];
}

@end

//
//  CanvasView.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/19.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CanvasView.h"
#import "MarkRenderer.h"

@implementation CanvasView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 使用访问者模式
    MarkRenderer *markRenderer = [[MarkRenderer alloc] initWithCGContext:context];
    [self.mark acceptMarkVisitor:markRenderer];
  
}

@end

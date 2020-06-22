//
//  MarkRenderer.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/6/10.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "MarkRenderer.h"


@implementation MarkRenderer

- (id)initWithCGContext:(CGContextRef)context {
    if (self = [super init]) {
        self.context = context;
        self.shouldMoveContextToDot = YES;
    }
    return self;
}

- (void)visitMark:(nonnull id)mark {
    // 默认 行为
}

- (void)visitDot:(nonnull Dot *)dot {
    CGFloat x = [dot location].x;
    CGFloat y = [dot location].y;
    CGFloat frameSize = [dot size];
    CGRect frame = CGRectMake(x - frameSize / 2.0, y - frameSize / 2.0, frameSize, frameSize);
    
    CGContextSetFillColorWithColor (self.context,[[dot color] CGColor]);
    CGContextFillEllipseInRect(self.context, frame);
}

- (void)visitStroke:(nonnull Stroke *)stroke {
    CGContextSetStrokeColorWithColor (self.context,[[stroke color] CGColor]);
    CGContextSetLineWidth(self.context, [stroke size]);
    CGContextSetLineCap(self.context, kCGLineCapRound);
    CGContextStrokePath(self.context);
    self.shouldMoveContextToDot = YES;
}

- (void)visitVertex:(nonnull Vertex *)vertex {
    CGFloat x = [vertex location].x;
    CGFloat y = [vertex location].y;
    
    if (self.shouldMoveContextToDot)
    {
        CGContextMoveToPoint(self.context, x, y);
        self.shouldMoveContextToDot = NO;
    }
    else
    {
        CGContextAddLineToPoint(self.context, x, y);
    }
}


@end

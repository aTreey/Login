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

- (void)visitDot:(nonnull Dot *)dot {
    
}

- (void)visitMark:(nonnull id)mark {
    
}

- (void)visitStroke:(nonnull Stroke *)stroke {
    
}

- (void)visitVertex:(nonnull Vertex *)vertex {
    
}


@end

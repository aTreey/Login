//
//  BezierPathView.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/24.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self.path stroke];
}


#pragma mark - Setter

- (void)setPath:(UIBezierPath *)path {
    _path = path;
    [self setNeedsDisplay];
}

@end

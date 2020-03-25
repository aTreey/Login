//
//  ClothCanvasView.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/12/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "ClothCanvasView.h"

@implementation ClothCanvasView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *backgroundImage = [UIImage imageNamed:@"cloth"];
        UIImageView *backgroundView = [[UIImageView alloc]
                                        initWithImage:backgroundImage];
        [self addSubview:backgroundView];
    }
    return self;
}

@end

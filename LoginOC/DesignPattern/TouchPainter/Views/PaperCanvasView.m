//
//  PaperCanvasView.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/12/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "PaperCanvasView.h"

@implementation PaperCanvasView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *backgroundImage = [UIImage imageNamed:@"paper"];
        UIImageView *backgroundView = [[UIImageView alloc]
                                        initWithImage:backgroundImage];
        [self addSubview:backgroundView];
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

@end

//
//  CommandSlider.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/11.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "CommandSlider.h"
#import "SetStrokeColorCommand.h"


@implementation CommandSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.command = [[SetStrokeColorCommand alloc] init];
    }
    return self;
}

@end

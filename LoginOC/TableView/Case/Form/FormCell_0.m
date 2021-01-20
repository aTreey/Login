//
//  FormCell_0.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/20.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FormCell_0.h"
#import "FormRow.h"


@implementation FormCell_0

- (void)initSubViews {
    [super initSubViews];
    self.leftLabel.text = @"标题0";
    self.rightLabel.text = @"副标题";
}

- (void)update {
    self.rightLabel.text = self.rowDescriptor.value ? self.rowDescriptor.value : self.rowDescriptor.noValueDisplayText;
    NSLog(@"FormCell_0 --- update");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

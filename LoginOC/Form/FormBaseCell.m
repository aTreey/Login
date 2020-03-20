//
//  FormBaseCell.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/20.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FormBaseCell.h"

@implementation FormBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    
    return self;
}

- (void)initSubViews {
    
}

@end

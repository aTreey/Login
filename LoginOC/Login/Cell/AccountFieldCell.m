//
//  AccountFieldCell.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "AccountFieldCell.h"
#import "AccoutCellModel.h"

@implementation AccountFieldCell


- (void)updateWithCellModel:(AccoutCellModel *)cellModel {
    self.textField.placeholder = cellModel.placeholder;
    self.textLabel.text = cellModel.tips;
}


@end

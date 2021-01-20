
//
//  FormRow.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FormRow.h"

@implementation FormRow

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super init]) {
        _style = style;
        _reuseIdentifier = reuseIdentifier;
    }
    return self;
}




@end

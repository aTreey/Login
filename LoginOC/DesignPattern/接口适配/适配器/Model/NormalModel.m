//
//  NormalModel.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/27.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "NormalModel.h"

@implementation NormalModel

+ (NormalModel *)model {
    NormalModel *normalModel = [[NormalModel alloc] init];
    normalModel.name = @"李四";
    normalModel.lineColor = [self randomColor];
    normalModel.phoneNumber = [self returnPhoneNumber];
    return normalModel;
}

+ (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

+ (NSString *)returnPhoneNumber{
    //定义一个包含数字，大小写字母的字符串
    NSString * strAll = @"0123456789";
    //定义一个结果
    NSString * result = [[NSMutableString alloc] initWithCapacity:11];
    for (int i = 0; i < 11; i++) {
        //获取随机数
        NSInteger index = arc4random() % (strAll.length-1);
        char tempStr = [strAll characterAtIndex:index];
        result = (NSMutableString *)[result stringByAppendingString:[NSString stringWithFormat:@"%c",tempStr]];
    }
    
    return result;
}

@end

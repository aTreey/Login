//
//  UIColor+Helpers.h
//  FreeBird
//
//  Created by xu-wenchao on 15/8/10.
//  Copyright (c) 2015年 liepin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  根据十六进制，生成颜色值
 *
 *  @param hexString #000000
 *  @alpha  alpha 0-1.0
 *
 *  @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 * 根据颜色，获取RGBA值
 *
 * @return NSARRAY 0代表R，1代表G，2代表B，3代表A
 */
+ (NSArray *)getRGBAWithColor:(UIColor *)color;


@end

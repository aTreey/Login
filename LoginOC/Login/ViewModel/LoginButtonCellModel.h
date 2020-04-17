//
//  LoginButtonCellModel.h
//  LoginOC
//
//  Created by yhp on 2018/3/27.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginButtonCellModel : NSObject

// 按钮标题
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) CGFloat height;



- (instancetype)initWithTite:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor cornerRadius:(CGFloat)cornerRadius height:(CGFloat)height;
@end

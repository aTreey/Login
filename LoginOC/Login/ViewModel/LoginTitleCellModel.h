//
//  LoginTitleCellModel.h
//  LoginOC
//
//  Created by yhp on 2018/3/23.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginTitleCellModel : NSObject
@property (nonatomic, copy) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;
@end

//
//  AccoutCellModel.h
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AccoutCellModel : NSObject

/**
 左边提示文字
 */
@property(nonatomic, copy) NSString *tips;

// 占位文字
@property(nonatomic, copy) NSString *placeholder;

- (instancetype)initWithTips:(NSString *)tips placeholder:(NSString *)placeholder;

@end

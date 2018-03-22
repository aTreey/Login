//
//  LoginItem.h
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellUpdatable <NSObject>

- (void)updateWithCellModel:(id)cellModel;

@end

@interface LoginItem : NSObject

/**
 重用标识
 */
@property(nonatomic, copy, readonly) NSString *reuseIdentifier;

/**
 注册cell类别
 */
@property(nonatomic, strong, readonly) Class cellClass;

/**
 模型
 */
@property(nonatomic, strong, readonly) id cellModel;


// 初始化
- (instancetype)initWithCell:(Class)cellClass;

- (instancetype)initWithCell:(Class)cellClass cellModel:(id)cellModel;


- (void)updateCell:(UITableViewCell *)cell;

@end

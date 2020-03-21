//
//  FormRow.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 - 使用MVVM 的思路，将每一行的视图类型、视图刷新以及事件处理由每一行各自处理，用 FormRow 对象进行管理
 - 单元格的构造，基于运行时和block，通过运行时构建cell，利用 row 对象的 cellClass 属性分别从代码加载可重用的 cell 视图
 - 调用 FormRow 的 configBlock 进行cell 内容的刷新和配置（包括了 cell内部的block回调事件）
 */


@interface FormRow : NSObject

/// 初始化方法
/// @param style 样式
/// @param reuseIdentifier 重用标识符
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

/// cell 样式
@property (nonatomic, assign, readonly) UITableViewCellStyle style;
/// cell 重用标识
@property (nonatomic, copy, readonly) NSString *reuseIdentifier;
/// cell 默认值
@property (nonatomic, copy) NSString *noValueDisplayText;
/// cell Class
@property (nonatomic, strong) Class cellClass;
/// cell 显示所需的model
@property (nonatomic, strong) id value;
/// cell 行高
@property (nonatomic, assign) CGFloat rowHeight;
/// cell 顶部分隔线
@property (nonatomic, assign) BOOL hasTopSep;
/// cell 底部分割线
@property (nonatomic, assign) BOOL hasBottomSep;
/// cell 是否显示，默认为显示
@property (nonatomic, assign, getter=isHidden) BOOL hidden;


/**
 cell 配置
 */

@property (nonatomic, copy) void(^rowConfigBlock)(id cell, id value, NSIndexPath *indexPath);

@end

NS_ASSUME_NONNULL_END

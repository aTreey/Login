//
//  Form.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormRow.h"

NS_ASSUME_NONNULL_BEGIN

@interface Form : NSObject

@property (nonatomic, strong, readonly) NSMutableArray <FormRow *> *rowArray;
@property (nonatomic, assign, readonly) NSUInteger count;
@property (nonatomic, assign, getter=isHidden) BOOL hidden;

- (void)addRow:(FormRow *)row;
- (void)addRowArray:(NSArray <FormRow *> *)rowArray;

/**
 因为支持 Row 的隐藏，根据 indexPath 取值时不能单方面地根据索引从数组中取值，也应考虑到是否有隐藏的对象，为此在 Form 定义了两个工具方法，用于关联 indexPath 与 Row 对象，在必要时调用
 */
/// 根据 indexPath 返回 row
- (FormRow *)rowAtIndexPath:(NSIndexPath *)indexPath;
/// 根据 row 返回 indexPath
- (NSIndexPath *)indexPathOfGSRow:(FormRow *)row;

- (NSDictionary *)validateRows;

@end

NS_ASSUME_NONNULL_END

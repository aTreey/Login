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

- (NSDictionary *)validateRows;

@end

NS_ASSUME_NONNULL_END

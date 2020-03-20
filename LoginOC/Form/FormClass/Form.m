//
//  Form.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/19.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "Form.h"

@interface Form ()

@property (nonatomic, strong, readwrite) NSMutableArray <FormRow *> *rowArray;

@end

@implementation Form

- (void)addRow:(FormRow *)row {
    [self.rowArray addObject:row];
}

- (void)addRowArray:(NSArray<FormRow *> *)rowArray {
    [rowArray enumerateObjectsUsingBlock:^(FormRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.rowArray addObject:obj];
    }];
}

#pragma mark - setter

- (NSMutableArray<FormRow *> *)rowArray {
    if (!_rowArray) {
        _rowArray = [NSMutableArray array];
    }
    return _rowArray;
}

- (NSUInteger)count {
    return self.rowArray.count;
}

- (NSDictionary *)validateRows {
    [self.rowArray enumerateObjectsUsingBlock:^(FormRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj.isHidden) {
            NSDictionary *dic = [NSMutableDictionary dictionary];
            
        }
    }];
    return nil;
}

@end

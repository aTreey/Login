//
//  LoginItem.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LoginItem.h"


@interface LoginItem ()

@property (nonatomic, strong, readwrite) Class cellClass;
@property(nonatomic, strong, readwrite) id cellModel;

@end


@implementation LoginItem

- (instancetype)initWithCell:(Class)cellClass {
    return [self initWithCell:cellClass cellModel:nil];
}

- (instancetype)initWithCell:(Class)cellClass cellModel:(id)cellModel {
    if (self = [super init]) {
        self.cellClass = cellClass;
        self.cellModel = cellModel;
    }
    return self;
}

- (void)updateCell:(UITableViewCell *)cell {
    if ([cell respondsToSelector:@selector(updateWithCellModel:)]) {
//        [cell performSelector:@selector(updateWithCellModel:)];
        [cell performSelector:@selector(updateWithCellModel:) withObject:self.cellModel];
    }
}


- (NSString *)reuseIdentifier {
    return [NSString stringWithFormat:@"%@", self.cellClass];
}

@end

//
//  MarkEnumerator.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/27.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkEnumerator : NSEnumerator

@property (nonatomic, strong, readonly) NSMutableArray *stack;

- (NSArray *)allObjects;
- (id)nextObject;

@end

NS_ASSUME_NONNULL_END

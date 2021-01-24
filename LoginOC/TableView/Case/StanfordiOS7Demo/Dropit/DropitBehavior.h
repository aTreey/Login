//
//  DropitBehavior.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/24.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DropitBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end

NS_ASSUME_NONNULL_END

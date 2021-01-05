//
//  KVOObject.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/5.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVOObject : NSObject

@property (nonatomic, assign) NSInteger value;

- (void)increase;

@end

NS_ASSUME_NONNULL_END

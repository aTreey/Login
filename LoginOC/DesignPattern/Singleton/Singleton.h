//
//  Singleton.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/9.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

+ (Singleton *) sharedInstance;

- (void) operation;

@end

NS_ASSUME_NONNULL_END

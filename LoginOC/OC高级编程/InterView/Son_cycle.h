//
//  Son_cycle.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/10.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Father_cycle;

NS_ASSUME_NONNULL_BEGIN

@interface Son_cycle : NSObject
@property (nonatomic, strong) Father_cycle *father;
@end

NS_ASSUME_NONNULL_END

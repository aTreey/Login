//
//  Father_cycle.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/10.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Son_cycle;

NS_ASSUME_NONNULL_BEGIN

@interface Father_cycle : NSObject
@property (nonatomic, strong) Son_cycle *son;

@end

NS_ASSUME_NONNULL_END

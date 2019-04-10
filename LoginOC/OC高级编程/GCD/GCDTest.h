//
//  GCDTest.h
//  LoginOC
//
//  Created by HongpengYu on 2019/3/14.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GCDTest : NSObject

- (void)dispatch_Group;

- (void)dispatch_sync;

- (void)dispatch_async;

- (void)dispatch_async_serialQueue;

- (void)dispatch_apply;

- (void)dispatch_Semaphore;

@end

NS_ASSUME_NONNULL_END

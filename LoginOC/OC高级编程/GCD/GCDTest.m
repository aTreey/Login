//
//  GCDTest.m
//  LoginOC
//
//  Created by HongpengYu on 2019/3/14.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "GCDTest.h"

@implementation GCDTest

- (void)gcdTest {

#pragma mark - GCD

/**
 GCD 统一处理复杂繁琐的多线程编程
 */

    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 长时间处理 如数据库访问
        
        // 处理结束后，主线程处理改结果
        dispatch_async(dispatch_get_main_queue(), ^{
            // 界面更新等
        });
        
    });
}

// 具体实现过程，使用过 NSObject 的 两个方法
- (void)launchThreeByNSObject_performSelectorInBackground {
    [self performSelectorInBackground: @selector(doWork) withObject:nil];
}

- (void)doWork {
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    /**
//     TODO: something
//     */
//
//
//    [self performSelectorOnMainThread:@selector(doneWork) withObject:nil waitUntilDone:NO];
//
//    [pool drain];
}

- (void)doneWork {
    // 主线程操作
}

@end

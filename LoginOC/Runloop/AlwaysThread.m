//
//  AlwaysThread.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/8.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "AlwaysThread.h"

@implementation AlwaysThread

// 自定义的线程
static NSThread *thread = nil;
// 标记是否要继续事件循环
static BOOL runAlways = YES;

+ (NSThread *)threadForDispatch{
    // 采用线程安全的方式创建线程
    if (thread == nil) {
        @synchronized (self) {
            if (thread == nil) {
                thread = [[NSThread alloc] initWithTarget:self selector:@selector(runRequest) object:nil];
                thread.name = @"always Threads TestName";
                // 启动
                [thread start];
            }
        }
    }
    return thread;
}

+ (void)runRequest {
    // 创建source
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    CFRunLoopSourceRef source = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    
    // 第一次调用 CFRunLoopGetCurrent()时会创建runloop，添加source
    CFRunLoopAddSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    
    while (runAlways) {
        @autoreleasepool {
            CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.0e10, true);
        }
    }
    CFRunLoopRemoveSource(CFRunLoopGetCurrent(), source, kCFRunLoopDefaultMode);
    CFRelease(source);
}

@end

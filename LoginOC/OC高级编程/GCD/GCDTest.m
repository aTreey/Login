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


- (void)GCDAPI {
    /**
     3.2.1 Dispatch Queue
     
     按照先进先出的顺序执行处理，存在两种Queque
     1. 串行队列
     2. 并发队列
     */
    
//    dispatch_async(queue, block0);
//    dispatch_async(queue, block1);
//    dispatch_async(queue, block2);
//    dispatch_async(queue, block3);
//    dispatch_async(queue, block4);
    
    // 1. 当queue 为DISPATCH_QUEUE_SERIAL 时 等待现在执行中处理结束，首先执行block0，等结束完成后在执行 block1，如此重复，同时执行的处理数只有1 个
    dispatch_queue_t mySerialDispatchQueue = dispatch_queue_create("com.example.gcd.MySerialDispatchQueue", NULL);

    
    // 2. 当queue 为 Concurrent Dispatch Queue 时，不用等待现在执行中的处理结束，就可以执行其他的bloc，如此重复
    dispatch_queue_t myconcurrentDispatchQueue = dispatch_queue_create("com.example.gcd.MyConcurrentDispatchQueue", DISPATCH_QUEUE_CONCURRENT);

    
    
    dispatch_async(myconcurrentDispatchQueue, ^{
        NSLog(@"block on MyConcurrentDispatchQueue");
    });

    // 即使在ARC 下生成的queue 必须又程序员负责释放内存，因为 dispatch_queue_t 并没有像Block 那样具有作为 OC 对象来处理的技术
    
//    dispatch_release(mySerialDispatchQueue);
//    dispatch_retain(myconcurrentDispatchQueue);
    
    
// 3.2.2   dispatch_queue_t 优先级
    // 通过 生成queue 都是使用默认优先级
    // 因为队列的问题并不是绝对的按照优先级来执行
    // 问题1: 存在的意义是什么？，应用场景是什么 ？
    
    dispatch_queue_t mainDispatchQueue = dispatch_get_main_queue();
    
    // 获取高优先级
    dispatch_queue_t globailDispatchQueueHight = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    // 获取默认优先级
    dispatch_queue_t globailDispatchQueueDefault = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

    // 获取低优先级
    dispatch_queue_t globailDispatchQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    
    dispatch_queue_t globailDispatchQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    
    // 3.2.3 设置优先级
    dispatch_queue_t mysericesDispathQueue1 = dispatch_get_main_queue();
    dispatch_queue_t mysericesDispathQueue = dispatch_queue_create("com.test.cnn", NULL);
    dispatch_queue_t global_DispatchQueueBackground = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    
    // 参数说明
    // 1. dispatch_object_t  _Nonnull object：要变更优先级的queue
    // 2. 目标优先级的queue
    // 两个参数都不能指定为系统的 mainQueue 和 Global Queue
    dispatch_set_target_queue(mysericesDispathQueue, global_DispatchQueueBackground);
    
    // 可以通过dispatch_set_target_queue 将多个穿行队列指定为和某一个目标穿行对列的优先级相同，此时在目标串行队列中只能同时处理一个队列，可达到防止处理并行执行
}


#pragma mark - dispatch_after
- (void)dispatch_after {
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    
    
    dispatch_after(time, dispatch_get_main_queue(), ^{
        NSLog(@"延时3s执行...");
    });
    
    // 并不是在指定时间后就执行处理，而是在指定时间在主线程中3 s 后执行处理操作
    // 因为Main dispatch Queue 在主线程的RunLoop 中执行，例如每隔1/60 s 执行的RunLoop 中，Block 最快会在3s 后执行，最慢也会在 3s + 1/60 s 后执行
    // 如果 Main dispatch Queue 中有大量的事件要处理或者本身有延迟，那么这个时间会更长
    
    
    
}

// dispatch_walltime 使用 计算绝对时间
dispatch_time_t getDispatchTimeByData(NSDate *date) {
    NSTimeInterval interval;
    double second, subSecond;
    struct timespec time;
    dispatch_time_t milestone;
    
    interval = [date timeIntervalSince1970];
    subSecond = modf(interval, &second);
    time.tv_sec = second;
    time.tv_sec = subSecond * NSEC_PER_SEC;
    milestone = dispatch_walltime(&time, 0);
    return milestone;
}

#pragma mark - dispatch Group

// 队列中有多个事件处理结束后再执行最终的事件

- (void)dispatch_Group {
    // 并行队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    
    // dispatch_group_async 和 dispatch_async 不同的是 后者追加的block 指定了group

    dispatch_group_async(group, queue, ^{
        NSLog(@"block0");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"block1");
    });
    
    dispatch_group_async(group, queue, ^{
        for (NSInteger i = 0; i < 10000; i++) {
            NSLog(@"block 2 for ");

        }
        NSLog(@"block2");
    });
    
    dispatch_group_async(group, queue, ^{
        NSLog(@"block3");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"done");
    });
    
    // 等待执行
//    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    
    // 返回值不为0，意味着虽然改过了指定的时间，但是group 中某一个操作还在执行中，
    // 如果返回值为0，全部处理执行结束
    // 如果指定的时间为 DISPATCH_TIME_NOW, 不用任何等待就可以判断group中的是否执行结束
    
    long result = dispatch_group_wait(group, time);
    long result2 = dispatch_group_wait(group, DISPATCH_TIME_NOW);

    
    if (result == 0) {
        NSLog(@"全部执行完");
    } else {
        // 未执行完某个任务
        NSLog(@"未执行完某个任务");
    }
}


#pragma mark - dispatch barrier_async

- (void)dispatch_barrier_async {
    dispatch_queue_t queue = dispatch_queue_create("com.example.gcd.ForBarrier", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        NSLog(@"读取数据0");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据1");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据2");
    });
    dispatch_async(queue, ^{
        NSLog(@"读取数据3");
    });
    dispatch_barrier_async(queue, ^{
        NSLog(@"写入数据3");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"读取数据4");
    });
    
    dispatch_async(queue, ^{
        NSLog(@"读取数据5");
    });
}

#pragma mark - 主线程死锁 一
- (void)dispatch_sync {
    // 主线程是串行队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 执行此 block 代码是需要等待 queue 队列中派发的 block 任务执行完之后在返回
    // block 处在 串行队列中会等待当前任务执行完成后再执行block 中的任务，其实当前执行的就是block 中的这些源代码，这样形成了一个相互等待的死锁状态
    dispatch_sync(queue, ^{
        NSLog(@"hello?");
    });
}


#pragma mark - 主线程死锁 二
- (void)dispatch_async {
    dispatch_queue_t queue2 = dispatch_get_main_queue();
    dispatch_async(queue2, ^{
        // 主线程中执行 指定block，并等待起执行结束，而其实主线程正在执行这些源代码，所以死锁
        dispatch_sync(queue2, ^{
            NSLog(@"hello");
        });
    });
}


#pragma mark - 主线程死锁 三

- (void)dispatch_async_serialQueue {
    dispatch_queue_t queue = dispatch_queue_create("com.example.learning", NULL);
    dispatch_async(queue, ^{
        /// 串行队列中同步执行也会形成死锁
        dispatch_sync(queue, ^{
            NSLog(@"hello");
        });
    });
}


#pragma mark - dispatch_apply

/// apply 在 dispatch_get_global_queue 中处理时间不定，会等待全部处理执行结束
/// dispatch_apply 和（dispatch_sync）同步函数相同，会等待处理执行结束，因此推荐在非同步地执行

- (void)dispatch_apply {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    /// 指定在当前queue 中需要执行在block 中的次数
    dispatch_apply(10, queue, ^(size_t index) {
        NSLog(@"%zu", index);
    });
    
    NSLog(@"dispatch_apply 执行完成");
    
    
    /**
     执行结果：
      0
      1
      2
      3
      4
      5
      6
      7
      8
      9
      dispatch_apply 执行完成

     */

    
    NSArray *array = @[@0, @1, @2, @3, @4, @5];
    
    /// 循环执行 数组中每个元素
    dispatch_apply([array count], queue, ^(size_t index) {
        NSLog(@"index = %zu, array = %@", index, [array objectAtIndex:index]);
    });
}



- (void)dispatch_Semaphore {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    NSMutableArray *array = [NSMutableArray array];
    
    /// 因为使用的是 DISPATCH_QUEUE_PRIORITY_DEFAULT 所以执行后因为内存错误而导致运行结束的概率很高
//    for (int i = 0; i < 100000; i++) {
//        dispatch_async(queue, ^{
//            [array addObject:[NSNumber numberWithInt:i]];
//
//            NSLog(@"array = %@", array);
//        });
//    }
    
    
    /**
     生成 dispatch_semaphore_t
     初始值为1 ，保证可访问 NSMutableArray 对象的线程同时只能有1 个
     
     */
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    for (int i = 0; i < 100000; i++) {
        dispatch_async(queue, ^{
            
            /**
             * 等待 dispatch semaphore
             *
             * 一直等待，直到 semaphore 的计数数值大于等于1
             */
             
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

            
            /**
             * 由于 semaphore的计数值达到了 >= 1，
             * 所以 semaphore 的计数值 减去 1
             * dispatch_semaphore_wait 函数执行返回
             *
             * 即执行到此时的 semaphore 的计数值恒为 0 
             *
             * 因为访问 NSMutableArray 类对象的线程只有1个，因此可安全地进行更新
             */
            
            [array addObject:[NSNumber numberWithInt:i]];
            
            /**
             * 任务处理结束后，所以通过 dispatch_semaphore_signal 函数将 dispatch semaphore 的计数值 加 1
             * 如果有通过 dispatch_semaphore_wait 函数等待计数值增加的线程，就由最先等待的线程执行
             */
            NSLog(@"array1111 = %@", array);

            /**
             信号量必须加1， 否则后面的线程讲全部被阻塞
             */
            dispatch_semaphore_signal(semaphore);

            
            NSLog(@"array2222 = %@", array);
            
        });
    }
    
//    dispatch_release(semaphore);
 }


- (void)dispatch_I_O {
    
}


@end

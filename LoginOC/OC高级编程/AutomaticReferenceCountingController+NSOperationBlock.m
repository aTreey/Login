//
//  AutomaticReferenceCountingController+NSOperationBlock.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/11.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController+NSOperationBlock.h"

@implementation AutomaticReferenceCountingController (NSOperationBlock)

- (void)theardTest {
    UILabel *alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,50,100,100)];
    alertLabel.text = @"Wait 4 seconds...";
    alertLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:alertLabel];
    
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:4]];
        
        // TODO: 没有在主线程更新UI
        alertLabel.text = @"Ready to go!";
    }];
}


- (void)theardTest2 {
    UILabel *alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(100,200,100,100)];
    alertLabel.text = @"Wait 4 seconds...";
    alertLabel.backgroundColor = [UIColor greenColor];
    [self.view addSubview:alertLabel];
    
    NSOperationQueue *backgroundQueue = [[NSOperationQueue alloc] init];
    [backgroundQueue addOperationWithBlock:^{
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:4]];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            alertLabel.text = @"Ready to go!";
        }];
    }];
}


/**
 以 scheduledTimerWithTimeInterval 的方式触发的 timer，在滑动页面上的列表时，timer 会暂停，为什么？该如何解决
 */
- (void)timer_test {
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(repeat:) userInfo:nil repeats:true];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)repeat:(UIButton *)button {
    NSLog(@"timer_test == %@", button);
}

@end

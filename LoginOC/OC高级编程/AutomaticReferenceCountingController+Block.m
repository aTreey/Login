//
//  AutomaticReferenceCountingController+Block.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/10.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController+Block.h"

@implementation AutomaticReferenceCountingController (Block)

- (void)test_block {
    int a = 6;
    int(^Block)(int) = ^int(int num){
        return a * num;
    };
    a = 4;
    NSLog(@"test_block-------result is %d", Block(2));
}


- (void)test__Block1 {
    NSMutableArray *array = [NSMutableArray array];
    void(^block)(void) = ^{
        [array addObject:@1234];
    };
    block();
}

- (void)test__Block2 {
    __block NSMutableArray *tempArray = nil;
    void(^block)(void) = ^{
        tempArray = [NSMutableArray array];
    };
    block();
}

/// __block 修饰符
- (void)test__Block3 {
    __block int a = 6;
    int(^Block)(int) = ^int(int num){
        return a * num;
    };
    a = 4;
    NSLog(@"__block--test__Block3---result is %d", Block(2));
}


/// __block 变量中的 __forwarding
- (void)test__Block4 {
    __block int multiplier = 10;
    self.blk = ^int(int num){
        return multiplier * num;
    };
    multiplier = 6;
    
    [self executeBlock];
}

- (void)executeBlock {
    int result = self.blk(4);
    NSLog(@"executeBlock result is %d", result);
}


@end

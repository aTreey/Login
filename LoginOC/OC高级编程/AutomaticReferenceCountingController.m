//
//  AutomaticReferenceCountingController.m
//  LoginOC
//
//  Created by HongpengYu on 2019/1/3.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController.h"
#import "GCDTest.h"
#import "AutomaticReferenceCountingController+KVO.h"
#import "AutomaticReferenceCountingController+Runtime.h"

#import "Father_cycle.h"
#import "Son_cycle.h"

@interface AutomaticReferenceCountingController ()
@property (nonatomic, strong) GCDTest *gcd;

@property (nonatomic, strong) Father_cycle *fater;
@property (nonatomic, strong) Son_cycle *son;


@end

@implementation AutomaticReferenceCountingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gcd = [[GCDTest alloc] init];

//    [self testDispatchGCD_sy];
    
//    [self testDispatch_semaphore];
    
    [self kvo_test];
    
    [self runTiemTest];
    
    [self retainCycle];
}


//+ (id) alloc {
//    return [self allocWithZone:NSDefaultMallocZone()];
//}
//
//+ (id) allocWithZone:(struct _NSZone *)zone {
//    return ;
//}

// alloc/retain/release/dealloc 实现


- (void)testGCD {
    [self.gcd dispatch_Group];
}

- (void)testDispatchGCD_sy {
    [self.gcd dispatch_sync];
    [self.gcd dispatch_async];
    [self.gcd dispatch_async_serialQueue];
    [self.gcd dispatch_apply];
}

- (void)testDispatch_semaphore {
    [self.gcd dispatch_Semaphore];
}


- (void)retainCycle {
    self.fater = [[Father_cycle alloc] init];
    self.son = [[Son_cycle alloc] init];
    
    self.fater.son = self.son;
    self.son.father = self.fater;
}

@end

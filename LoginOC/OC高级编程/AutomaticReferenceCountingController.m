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
#import "AutomaticReferenceCountingController+Block.h"
#import "AutomaticReferenceCountingController+NSOperationBlock.h"
#import "AutomaticReferenceCountingController+AddProperty.h"

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
    
    [self test_block];
    
    [self test__Block3];
    
//    [self test__Block4];
    
    [self string_copy];
    
    
    [self theardTest];
    
    [self theardTest2];
    
//    [self timer_test];
    
    [self test_associateProperty];
    
    NSLog(@"self.associateProperty = %@", self.associateProperty);
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
    
    // 验证循环引用，内存泄露问题
    self.fater.son = self.son;
    self.son.father = self.fater;
}

- (void)string_copy {
    self.fater = [[Father_cycle alloc] init];
    self.son = [[Son_cycle alloc] init];
    
    
    NSMutableString *mutableTitle = [NSMutableString stringWithString:@"123"];

    
    /**
     name_mutable 是可变的，但是被copy 修饰后会变成不可变，此处修改值会崩溃
     */
    self.fater.name_mutable = mutableTitle;
//    [self.fater.name_mutable appendString:@"456"];
    
    
    
    /**
     strong 修饰字符串
     */
    self.fater.title_strong = @"title_strong";
    NSLog(@"mutableTitle1 = %@", self.fater.title_strong);
    
    self.fater.title_strong = mutableTitle;
    NSLog(@"mutableTitle2 = %@", self.fater.title_strong);
    
    /**
     再次修改 mutableTitle 可变字符串的值，
     原来的title_strong 也会被同时修改
     因为 title_strong 被strong 修饰，则两者对应的内存地址相同是同一个内存空间，只是引用计数+1了，并没有创建新的内存空间
     */
    [mutableTitle appendString:@"-789"];
    NSLog(@"mutableTitle = %@", mutableTitle);
    NSLog(@"mutableTitle3 = %@", self.fater.title_strong);
    
    
    /**
     copy 修饰字符串
     */
    
    self.fater.title_copy = @"title_copy";
    NSLog(@"title_copy1 = %@", self.fater.title_copy);
    
    self.fater.title_copy = mutableTitle;
    NSLog(@"title_copy2 = %@", self.fater.title_copy);
    NSLog(@"title_copy2 = %@", _fater.title_copy);
    
    
    /**
     再次修改 mutableTitle 可变字符串的值，
     原来的title_copy 不会被修改，因为 title_copy 被 copy 修饰创建了新的内存空间
     
     */
    
    [mutableTitle appendString:@"-copy_title"];
    NSLog(@"mutableTitle = %@", mutableTitle);
    NSLog(@"mutableTitle3 = %@", self.fater.title_copy);
    
}

@end


//
//  ObserverPatternViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/5/20.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "ObserverPatternViewController.h"
#import "SubscriptionServiceCenter.h"


// 科学杂志
static NSString *SCIENCE = @"SCIENCE";

@interface ObserverPatternViewController ()<SubscriptionServiceCenterProtocol>

@end

@implementation ObserverPatternViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建订阅号
    [SubscriptionServiceCenter creatSubscriptionNumber:SCIENCE];
    
    // 添加对象到指定的订阅号
    [SubscriptionServiceCenter addCustomer:self subscriptionNumber:SCIENCE];
    
    // 订阅中心发消息
    [SubscriptionServiceCenter sendMessage:@"订阅了 SCIENCE--V1.0" toSubscriptionNumber:SCIENCE];
}


- (void)subscriptionMessgae:(id)message number:(NSString *)number {
    NSLog(@"subscriptionMessgae --- %@ ----- number === %@", message, number);
}

@end

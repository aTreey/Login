//
//  ViewControllerIntercepter.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/3/3.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "ViewControllerIntercepter.h"
#import <Aspects/Aspects.h>

/// 使用AOP编程，避免controller的继承，降低业务集成、上手成本，统一配置controller，不限于UIViewController

@implementation ViewControllerIntercepter

/// 会在应用启动的时候自动被runtime调用，通过重载这个方法来实现最小的对业务方的“代码入侵
+ (void)load {
    [super load];
    [ViewControllerIntercepter sharedInstance];
}

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static ViewControllerIntercepter *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (instancetype)init {
    if (self = [super init]) {
        // 方法交换
        [self hookLifeCycle];
    }
    return self;
}

- (void)hookLifeCycle {
    [UIViewController aspect_hookSelector:@selector(viewDidLoad) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo) {
        [self viewDidLoad:[aspectInfo instance]];
    } error:NULL];
    
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo>aspectInfo, BOOL animated) {
        [self viewWillAppear:animated viewController:[aspectInfo instance]];
    } error:NULL];
}


- (void)viewDidLoad:(UIViewController *)viewController {
    NSLog(@"统一配置viewController：==== viewDidLoad");
    [self setupNavgaitonBar:viewController];
}

- (void)viewWillAppear:(BOOL)animated viewController:(UIViewController *)viewController {
    NSLog(@"统一配置viewController：==== viewWillAppear");
}

- (void)setupNavgaitonBar:(UIViewController *)viewController {
    [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
    [viewController.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],
                                                                                NSForegroundColorAttributeName:[UIColor blackColor]}];
}

@end

//
//  AbstractFactoryViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/2.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "AbstractFactoryViewController.h"
#import "BrandingFactory.h"

@interface AbstractFactoryViewController ()

@end

@implementation AbstractFactoryViewController

- (void)loadView {
    
    // 使用抽象工厂方法创建, 在 + (BrandingFactory *)factory 中会根据当前编译配置返回具体的工厂实例
    BrandingFactory *factory = [BrandingFactory factory];
    
    UIView *view = [factory brandedView];
    
    UIView *button = [factory brandedMainButton];
    
    UIView *toolbar = [factory brandedToolbar];
    
    
    [self cocoaTouchWithAbstractFactory];
}

- (void)cocoaTouchWithAbstractFactory {
    NSNumber * boolNumber = [NSNumber numberWithBool:YES];
    NSNumber * charNumber = [NSNumber numberWithChar:'a'];
    NSNumber * intNumber = [NSNumber numberWithInt:1];
    NSNumber * floatNumber = [NSNumber numberWithFloat:1.0];
    NSNumber * doubleNumber = [NSNumber numberWithDouble:1.0];

    NSLog(@"%@", [[boolNumber class] description]);
    NSLog(@"%@", [[charNumber class] description]);
    NSLog(@"%@", [[intNumber class] description]);
    NSLog(@"%@", [[floatNumber class] description]);
    NSLog(@"%@", [[doubleNumber class] description]);
    
    NSLog(@"%d", [boolNumber intValue]);
    NSLog(@"%@", [charNumber boolValue] ? @"YES" : @"NO");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end

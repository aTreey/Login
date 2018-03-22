//
//  ViewController.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "ViewController.h"
#import "LoginController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *testButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:testButton];
    testButton.backgroundColor = [UIColor orangeColor];
    [testButton setTitle:@"login" forState:UIControlStateNormal];
    [testButton addTarget:self action:@selector(testButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    testButton.translatesAutoresizingMaskIntoConstraints = false;
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:80];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:400];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60];

    [self.view addConstraints:@[top, left, right,width, height]];
    
}




- (void)testButtonAction {
    LoginController *loginController = [LoginController new];
    [self.navigationController pushViewController:loginController animated:YES];
}


@end

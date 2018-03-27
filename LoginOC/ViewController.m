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
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-40];
    
    NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:30];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-30];
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:400];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:testButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:60];

    [self.view addConstraints:@[bottom, left, right,width, height]];
    
    
//    [self test];
    [self spaceTest];
    
    [self containerCenter];
}


- (void)spaceTest {
    
    // 创建layoutGuide
    UILayoutGuide *space1 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:space1];
    UILayoutGuide *space2 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:space2];
    UILayoutGuide *space3 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:space3];
    UILayoutGuide *space4 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:space4];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"1111";
    label.backgroundColor = [UIColor purpleColor];
    label.textColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    
    [space1.widthAnchor constraintEqualToConstant:40].active = YES;
    [space2.widthAnchor constraintEqualToAnchor:space1.widthAnchor].active = YES;
    [space3.widthAnchor constraintEqualToAnchor:space1.widthAnchor].active = YES;
    [space1.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-100].active = YES;
    [space1.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
    
    
    [view1.heightAnchor constraintEqualToConstant:60].active = YES;
    [view1.widthAnchor constraintEqualToConstant:30].active = YES;
    
    [view2.heightAnchor constraintEqualToConstant:90].active = YES;
    [view2.widthAnchor constraintEqualToConstant:30].active = YES;
    
    [view1.centerYAnchor constraintEqualToAnchor:space1.centerYAnchor].active = YES;
    [view2.centerYAnchor constraintEqualToAnchor:space1.centerYAnchor].active = YES;
    [label.centerYAnchor constraintEqualToAnchor:space1.centerYAnchor].active = YES;
    
    [view1.leadingAnchor constraintEqualToAnchor:space1.trailingAnchor].active = YES;
    [space2.leadingAnchor constraintEqualToAnchor:view1.trailingAnchor].active = YES;
    [view2.leadingAnchor constraintEqualToAnchor:space2.trailingAnchor].active = YES;
    [space3.leadingAnchor constraintEqualToAnchor:view2.trailingAnchor].active = YES;
    [label.leadingAnchor constraintEqualToAnchor:space3.trailingAnchor].active = YES;
}


- (void)containerCenter {
    
    // 创建layoutGuide
    UILayoutGuide *containerGuide = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:containerGuide];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"居中显示";
    label.backgroundColor = [UIColor purpleColor];
    label.textColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    // view1
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view1];
    
    // view2
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    // 设置view 为layout布局
    label.translatesAutoresizingMaskIntoConstraints = NO;
    view1.translatesAutoresizingMaskIntoConstraints = NO;
    view2.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    // 设置containerGuide约束
    [containerGuide.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [containerGuide.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [containerGuide.heightAnchor constraintEqualToConstant:5].active = YES;

    // 设置view1约束
    [view1.widthAnchor constraintEqualToConstant:80].active = YES;
    [view1.heightAnchor constraintEqualToConstant:60].active = YES;
    [view1.leftAnchor constraintEqualToAnchor:containerGuide.leftAnchor].active = YES;
    [view1.centerYAnchor constraintEqualToAnchor:containerGuide.centerYAnchor].active = YES;
    
    // 设置label约束
    [label.leftAnchor constraintEqualToAnchor:view1.rightAnchor constant:10].active = YES;
    [label.centerYAnchor constraintEqualToAnchor:containerGuide.centerYAnchor].active = YES;
    
    // 设置view2约束
    [view2.widthAnchor constraintEqualToConstant:120].active = YES;
    [view2.heightAnchor constraintEqualToConstant:40].active = YES;
    [view2.leftAnchor constraintEqualToAnchor:label.rightAnchor constant:20].active = YES;
    [view2.rightAnchor constraintEqualToAnchor:containerGuide.rightAnchor].active = YES;
    [view2.centerYAnchor constraintEqualToAnchor:containerGuide.centerYAnchor].active = YES;
}

- (void)test {
    
    UILayoutGuide *view_Guide = self.view.layoutMarginsGuide;
    NSLog(@"layoutMarginsGuide----- x = %f, y = %f, width = %f, height = %f", view_Guide.layoutFrame.origin.x, view_Guide.layoutFrame.origin.y, view_Guide.layoutFrame.size.width, view_Guide.layoutFrame.size.height);
    
//    UILayoutGuide *testGuide = [[UILayoutGuide alloc] init];
//    NSLog(@"testGuide----- x = %f, y = %f, width = %f, height = %f", testGuide.layoutFrame.origin.x, testGuide.layoutFrame.origin.y, testGuide.layoutFrame.size.width, testGuide.layoutFrame.size.height);
    /**
     左边黄色view
     */
    UIView *yellow_View = [[UIView alloc] init];
    yellow_View.backgroundColor = [UIColor yellowColor];
    yellow_View.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:yellow_View];
    //左边距约束
    NSLayoutConstraint *yellowView_Leading = [yellow_View.leadingAnchor constraintEqualToAnchor:view_Guide.leadingAnchor];
    //顶部约束
    NSLayoutConstraint *yellowView_Top = [yellow_View.topAnchor constraintEqualToAnchor:view_Guide.topAnchor constant:100];
    //宽度约束
    NSLayoutConstraint *yellowView_Width = [yellow_View.widthAnchor constraintEqualToConstant:100];
    //高度约束
    NSLayoutConstraint *yellow_Height = [yellow_View.heightAnchor constraintEqualToConstant:40];
    [NSLayoutConstraint activateConstraints:@[yellowView_Leading,yellowView_Top,yellow_Height,yellowView_Width]];
    
    
    
    UIView *yellow_View2 = [[UIView alloc] init];
    yellow_View2.backgroundColor = [UIColor redColor];
    yellow_View2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:yellow_View2];

    UILayoutGuide *view_Guide2 = [[UILayoutGuide alloc] init];
    [self.view addLayoutGuide:view_Guide2];

    //左边距约束
    [yellow_View2.leadingAnchor constraintEqualToAnchor:view_Guide2.leadingAnchor].active = YES;
    //顶部约束
    [yellow_View2.topAnchor constraintEqualToAnchor:view_Guide2.topAnchor constant:100 + 200].active = YES;
    //宽度约束
    [yellow_View2.widthAnchor constraintEqualToConstant:100].active = YES;
    //高度约束
    [yellow_View2.heightAnchor constraintEqualToConstant:40].active = YES;
    
    
    /**
     居中的红色view
     */
//    UIView *middleView = [[UIView alloc]init];
//    middleView.backgroundColor = [UIColor redColor];
//    middleView.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.view addSubview:middleView];
//    //水平居中
//    NSLayoutConstraint *middleView_CenterX = [middleView.centerXAnchor constraintEqualToAnchor:view_Guide.centerXAnchor];
//    //垂直居中
//    NSLayoutConstraint *middleView_CenterY = [middleView.centerYAnchor constraintEqualToAnchor:view_Guide.centerYAnchor];
//
//
//    NSLayoutConstraint *bottom = [middleView.bottomAnchor constraintEqualToAnchor:self.bottomLayoutGuide.topAnchor];
//
//
//
//    //宽度约束
//    NSLayoutConstraint *middleView_Width = [middleView.widthAnchor constraintEqualToConstant:100];
//    //高度约束
//    NSLayoutConstraint *middleView_Height = [middleView.heightAnchor constraintEqualToConstant:100];
//    [NSLayoutConstraint activateConstraints:@[middleView_CenterX,bottom,middleView_Height,middleView_Width]];
}


- (void)testButtonAction {
    LoginController *loginController = [LoginController new];
    [self.navigationController pushViewController:loginController animated:YES];
}


@end

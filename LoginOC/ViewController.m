//
//  ViewController.m
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "ViewController.h"
#import "LoginController.h"
#import "LiveController.h"
#import "UIViewController+LayoutGuide.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test];
    
//    [self spaceTest];
//
//    [self containerCenter];
//
//    [self testAutoresizingMask];
    
//    [self suspendPlayVido];
    
    [self loginModule];
    
    [self dropMenuView];
}


// 视屏播放
- (void)tapAction {
    LiveController *liveVC = [LiveController new];
    [self.navigationController pushViewController:liveVC animated:true];
}


- (void)testButtonAction {
    LoginController *loginController = [LoginController new];
    [self.navigationController pushViewController:loginController animated:YES];
}


@end

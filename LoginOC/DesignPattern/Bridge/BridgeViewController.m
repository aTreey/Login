//
//  BridgeViewController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/14.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "BridgeViewController.h"
#import "TouchConsoleController.h"

@interface BridgeViewController ()

@property (nonatomic, strong) TouchConsoleController *touchConsoleController;

@end

@implementation BridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.touchConsoleController = [TouchConsoleController new];
    
    [self.touchConsoleController up];
}



@end

//
//  EffectiveDetailController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/8/31.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EffectiveDetailController.h"

#import "EOCPerson+Methods.h"

@interface EffectiveDetailController ()

@end

@implementation EffectiveDetailController

/// 第23条 通过委托与数据源协议进行对象间通信

/// eg: 从网络上获取数据
/// 1. 访问网络可能需要很长的时间，在此期间阻塞程序是个糟糕的体验，通过委托模式获取完成后哦回调这个委托对象


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
    
    [self categoryTest];
}


- (void)categoryTest {
    EOCPerson *person = [EOCPerson new];
    
    EOCPerson *friend_A = [EOCPerson new];
    EOCPerson *friend_B = [EOCPerson new];
    [person addFriend:friend_A];
    [person addFriend:friend_B];
}


@end

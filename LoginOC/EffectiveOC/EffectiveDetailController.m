//
//  EffectiveDetailController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/8/31.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EffectiveDetailController.h"
//#import "EOCPerson_7.h"
//#import "EOCPerson8.h"
//
//
//#import "EOCPerson+Methods.h"
//
//#import "EOCPerson_27.h"

@interface EffectiveDetailController ()
@end

@implementation EffectiveDetailController

/// 第23条 通过委托与数据源协议进行对象间通信

/// eg: 从网络上获取数据
/// 1. 访问网络可能需要很长的时间，在此期间阻塞程序是个糟糕的体验，通过委托模式获取完成后哦回调这个委托对象


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.cyanColor;
//
//    [self test_7];
//    [self test_8];
//    [self categoryTest];
}


//- (void)categoryTest {
//    EOCPerson *person = [EOCPerson new];
//
//    EOCPerson *friend_A = [EOCPerson new];
//    EOCPerson *friend_B = [EOCPerson new];
//    [person addFriend:friend_A];
//    [person addFriend:friend_B];
//
//    EOCPerson_27 *person_27 = [[EOCPerson_27 alloc] initWithFirstName:@"Lee" lastName:@"xiaoLong"];
//    NSLog(@"person_27.firstName = %@, person_27.lastName = %@", person_27.firstName, person_27.lastName);
//
//    // 第27 条通过匿名分类（类扩展）接口中声明为'只读'的属性扩展为‘可读写’，只能在内部设置，外界还是只读属性
//    //
////    person_27.firstName = @"zhang";   // 报错 ：Assignment to readonly property
////    person_27.lastName  = @"ming";  // 报错 ：Assignment to readonly property
//
//}
//
//
//- (void)test_7 {
//    EOCPerson_7 *person = [EOCPerson_7 new];
//    person.lastName = @"zhang";
//}
//
//- (void)test_8 {
//    EOCPerson8 *person = [EOCPerson8 new];
//    [person methond];
//    [person methond4];
//}

@end

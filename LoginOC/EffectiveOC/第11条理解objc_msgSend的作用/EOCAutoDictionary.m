//
//  EOCAutoDictionary.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCAutoDictionary.h"

@implementation EOCAutoDictionary

// C语言静态函数
void printHello() {
    printf("hello world!\n");
}

void printGoogbye() {
    printf("Googbye, world!\n");
}

void doTheThing(int type) {
    if (type == 0) {
        printHello();
    } else {
        printGoogbye();
    }
}

// C语言动态调用
void doTheThing2(int type) {
    void (*fnc)();
    if (type == 0) {
        fnc = printHello;
    } else {
        fnc = printGoogbye;
    }
    fnc();
}

// OC 消息机制



@end

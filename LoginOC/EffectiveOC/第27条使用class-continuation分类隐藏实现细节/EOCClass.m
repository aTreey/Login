//
//  EOCClass.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCClass.h"

///  用法一： 使用‘class-continuation‘解决 "绝密类" 信息暴露的问题，必须声明在类实现文件中才可以，
@interface EOCClass () {
    EOCSuperSecretClass *_secretinstance1;
}

@end

@implementation EOCClass

/*方法实现*/ 

@end

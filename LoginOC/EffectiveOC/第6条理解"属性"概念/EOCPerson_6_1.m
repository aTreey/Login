//
//  EOCPerson_6_1.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/2.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson_6_1.h"

// 使用 @dynamic 关键词
// 不要自动生成实例变量的存取方法

@implementation EOCPerson_6_1
//@dynamic firstName, lastName;
// 从CoreData 框架中 NSManagerObject 继承的子类某些属性不是实例变量，需要在运行时创建存取方法，数据来自后端的数据库中
@dynamic firstName, lastName;

- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    if ((self = [super init])) {
        
// Fixe :不应该在 init 或者 （deallc）方法中调用‘setter’、‘getter’方法
//        self.firstName = firstName;
//        self.lastName = lastName;
        
//        self.firstName = [firstName copy];
//        self.lastName = [lastName copy];
    }
    return self;
}


@end

////////////////////// 结论 /////////////
/// 1. 用@property定义对象中所封装的数据
/// 2. 使用“特质”关键字指定存储数据所需的正确语义
/// 3. 设置属性所对应的实例变量时，一定要遵从该属性所声明的语义
/// 4. iOS开发中使用 nonatomic 属性，因为 atomic 属性会严重影响性能


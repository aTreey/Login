//
//  EOCPerson_27.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/8.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson_27.h"
#import "EOCSecretDelegate.h"

/// 用法二： 在 “class continuation 分类”（我理解的为类扩展（匿名分类））中把两个属性扩展为”可读写“，必须写在类的实现部分声明，如果在类的声明部分就会覆盖本身声明的属性就会暴露出来，外界可以修改其属性
// 在 EOCPerson_27 类的实现中就可以随意的调用setFirstName: 或者setLastName：这两个设置方法，
// 可以使用点语法来设置属性

/// 用法四：如果对象遵守的协议为私有，则可以在“class-continuation分类”中声明
@interface EOCPerson_27 () <EOCSecretDelegate>

@property (nonatomic, copy, readwrite) NSString *firstName;
@property (nonatomic, copy, readwrite) NSString *lastName;
/// 用法三： 在 “class continuation 分类”（类扩展（匿名分类））中可以声明只会在类中用的私有方法

- (void)p_privateMethond;
@end

@implementation EOCPerson_27

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
    }
    return self;
}


#warning 使用带下划线的成员变量，不能使用‘self’因为会形成死循环

- (void)setFirstName:(NSString * _Nonnull)firstName {
    NSLog(@"firstName = %@",firstName);
    _firstName = firstName;
}


- (void)setLastName:(NSString * _Nonnull)lastName {
    NSLog(@"lastName = %@",lastName);
    _lastName = lastName;
}

- (void)changeReadOnlyProperty {
    self.firstName = @"修改— firstName";
}


- (void)p_privateMethond {
    NSLog(@"p_privateMethond");
}

@end

////////////////////// 结论 /////////////
/// 1. 使用“class-continuation”向类中增加实现变量
/// 2. 在类的实现.m文件中扩展接口中的“只读”属性为“可读写”，对外仍然为只读，而在内部又可以用修改属性值
/// 3. 若想使类遵守的协议不为人知，可以在匿名分类（类扩展）中声明


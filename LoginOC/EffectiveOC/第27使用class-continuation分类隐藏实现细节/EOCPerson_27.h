//
//  EOCPerson_27.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/8.
//  Copyright © 2018 HongpengYu. All rights reserved.
//  本类中是将接口中声明为'只读'的属性扩展为‘可读写’，以便在内部设置其值
/// - 我们通常不直接访问实例变量，而是通过设置访问方法来做，因为这样能触发KVO 通知，其他对象有可能正在监听此事件


#import <Foundation/Foundation.h>
#import "EOCSecretDelegate.h"
//@protocol EOCSecretDelegate;
//@class EOCSecretDelegate;

// 本类中是将接口中声明为'只读'

NS_ASSUME_NONNULL_BEGIN

// 用法四：如果对象遵守的协议为私有，则可以在“class-continuation分类”中声明

/// 例如：EOCPerson_27 遵守了 EOCSecretDelegate 协议，此协议在私有的API中，如果声明在公共接口理，写法如下
//@interface EOCPerson_27 : NSObject <EOCSecretDelegate>
// ....
//@end

/// 缺点：
///    1. 这样就会对外界公开泄露此类遵守的协议信息（协议本身是在私有API中，并不想对外公开）
///    2. 通过向前声明协议 ”@protocol‘ EOCSecretDelegate“ 代替 #import "EOCSecretDelegate.h"编译会报错，或者警告

/// 解决方法： 使用“class-continuation分类”

@interface EOCPerson_27 : NSObject
@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;

- (instancetype)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
@end

NS_ASSUME_NONNULL_END



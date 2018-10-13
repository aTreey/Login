//
//  EOCPerson_6.h
//  LoginOC
//
//  Created by HongpengYu on 2018/10/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson_6 : NSObject

// 声明实例变量

{
@public
    NSString *_firstName;
    NSString *_lastName;

@private
    NSString *_someInternalData;
}

// 以上定义变量：
// 对象布局在编译期就已经固定了，只要碰到访问 _firstName 变量的代码时，编译器就吧其替换为“偏移量”，这个“偏移量”是“硬编码”，表示该变量距离存放对象的内存区域的起始地址有多远；如果又另加一个实例变量，就需要重新编译一遍，否则就会出错


// 使用 @property 关键字自动生成setter 和getter 方法
@property NSString *firstName;
@property NSString *lastName;

// 使用 @property 代码写出来的和下面写法等效
- (NSString * _Nonnull)firstName;
- (void)setFirstName:(NSString * _Nonnull)firstName;
- (NSString * _Nonnull)lastName;
- (void)setLastName:(NSString * _Nonnull)lastName;

@end

NS_ASSUME_NONNULL_END

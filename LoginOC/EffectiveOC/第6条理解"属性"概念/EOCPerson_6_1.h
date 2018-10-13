//
//  EOCPerson_6_1.h
//  LoginOC
//
//  Created by HongpengYu on 2018/10/2.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson_6_1 : NSManagedObject
//@property (copy) NSString *firstName;
//@property (copy) NSString *lastName;

//@property (nonatomic, copy) NSString *firstName;
//@property (nonatomic, copy) NSString *lastName;



// 属性特质
//@property (nonatomic, readwrite, copy) NSString *firstName1;

/**
 原子性：指在并发编程中，系统其他部分无法观察到其中间步骤所生成的临时结果，而只能看到操作前和操作后的结果
 默认情况下，有编译器所合成的方法会通过锁定机制来确保其原子性，如果属性具备 nonatomic，则不使用同步锁
 读写/权限：
 
 readwrite：拥有 ‘getter’ 和 ‘setter’方法，若使用了 @synthesize 实现，则编译器自动生成两个方法
 
 readonly：只拥有 ’getter‘方法，只有使用 @synthesize 时，才会合成 ’getter‘方法，可以利用此特质把某个属性对外公开为 readonly ，然后在g‘class-coninuatuing分类’（匿名分类（类扩展））中将其重新定义为读写属性，第27 条详细讲述
 
 内存管理语义：
 属性用于封装数据，而数据具有“具体的所有权语义”，例如：调用‘setter’方法设置一个值时，他应该是“保留”（retain）此值呢还是将其赋值给底层的实例变量就好？
 assgin：只会针对“纯量类型”，即基本类型的变量
 strong：此特质表明该属性定义了一种“拥有关系”，设置新值时，设置方法会先保留新值，并释放旧值，然后再赋上新值
 weak：此特质表明该属性定义了一种“非拥有关系”，设置新值时，即不先保留新值，也不释放旧值，次特质同 assign，在属性所指对象c遭到催毁时，属性值也会清空
 unsafe_unretained：此特质和assign相同，但是它只适用于‘对象类型’，表达一种“非拥有关系”（不保留，unretained），当目标对象摧毁时，属性值不会自动清空（unsafe），这点和 ’weak‘ 有区别
 copy：此特质所表达的所属关系与 strong 类似，然而’setter‘方法并不保留新值，而是将其’拷贝‘（copy）
 
 当属性类型时 NSString * 时，经常使用copy 来保护其封装性，因为传递给设置方法的新值可能指向一个NSMutableString 类的实例，他是 NSString 的子类，表示可以修改其值的字符串，如果不拷贝字符串，那么设置完属性之后，字符串的值就有可能在对象不知情的情况下遭人更改
 */


- (id)initWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;

// 尽量使用不可变的对象，那么就应该设置为‘readonly’，用初始化方法设置好属性之后就不能再改变，声明如以下：
@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;

@end

NS_ASSUME_NONNULL_END

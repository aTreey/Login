//
//  EOCPerson8.m
//  
//
//  Created by HongpengYu on 2018/10/13.
//

#import "EOCPerson8.h"

@implementation EOCPerson8

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

// 一、等同性
- (void)methond {
    NSString *foo = @"Badger 123";
    NSString *bar = [NSString stringWithFormat:@"Badger %i", 123];
    BOOL equalA = (foo == bar); // NO
    BOOL equalB = [foo isEqual: bar]; // YES
    BOOL equalC = [foo isEqualToString:bar]; // YES
    
    NSLog(@"-- %d -- %d --- %d", equalA, equalB, equalC);
}

// 两个方法默认是实现是： 当且仅当“指针值”完全相等时两个对象才想等
//- (BOOL)isEqual:(id)object;
//- (NSUInteger)hash;


// 重写 isEqual 方法
/*
- (BOOL)isEqual:(id)object {
    // 1 判断指针是否想等
    if (self == object) return YES;
    // 2 是否所属同一个类
    if ([self class] != [object class]) return NO;
    // 3 继承情况
    EOCPerson8 *otherPerson = (EOCPerson8 *)object;
    if (![_firstName isEqualToString:otherPerson.firstName]) {
        return NO;
    }
    
    if (![_lastName isEqualToString:otherPerson.lastName]) {
        return NO;
    }
    
    if (_age != otherPerson.age) {
        return NO;
    }
    
    return YES;
}

// 重写 hash 方法
// 有性能问题

- (NSUInteger)hash {
    return 1337;
}

 
- (NSUInteger)hash {
    NSString *stringToHash = [NSString stringWithFormat:@"%@:%@:%lu", _firstName, _lastName, _age];
    return [stringToHash hash];
}

 */

- (NSUInteger)hash {
    NSUInteger firstNameHash = [_firstName hash];
    NSUInteger lastNameHash = [_lastName hash];
    NSUInteger ageHash = _age;
    return firstNameHash ^ lastNameHash ^ ageHash;
}

// 二、特定类所具有的等同性判定方法
// 编写判定方法时，应该覆写 “isEqual” 方法，如果接受消息的对象和参数中的对象属于同一个类，就调用自己的判定方法，否则交个超类判断
- (BOOL)isEqualToPerson:(EOCPerson8 *)otherPerson {
    if (self == otherPerson) return YES;
    if (![_firstName isEqualToString:otherPerson.firstName]) {
        return NO;
    }
    
    if (![_lastName isEqualToString:otherPerson.lastName]) {
        return NO;
    }
    
    if (_age != otherPerson.age) {
        return NO;
    }
    return YES;
}

- (BOOL)isEqual:(id)object {
    if ([self class] == [object class]) {
        return [self isEqualToPerson:(EOCPerson8 *)object];
    } else {
        return [super isEqual:object];
    }
}

// 三、等同性判定的执行深度
// @property (nonatomic, assign) NSUInteger identifier; // 唯一标识符（数据库主键）只需判断两个标识符是否相同就可以得知是否同一个对象

// 四、容器中可变类的等同性
- (void)methond4 {
    // 1
    NSMutableSet *set = [NSMutableSet set];
    
    // 2
    NSMutableArray *arrayA = [@[@1, @2] mutableCopy];
    [set addObject:arrayA];
    NSLog(@"set = %@", set);
    // set = {((1, 2)}
    
    // 3
    NSMutableArray *arrayB = [@[@1, @2] mutableCopy];
    [set addObject:arrayB];
    NSLog(@"set = %@", set);
    // set = {((1, 2)}
    
    
    // 因为两次加入的数组对象想等，所以set 并未改变
    
    // 4 添加一个和已有对象不同的数组
    NSMutableArray *arrayC = [@[@1] mutableCopy];
    [set addObject:arrayC];
    NSLog(@"set = %@", set);
    // set = {((1),(1, 2)}
    
    // 5 改变 arrayC 的内容和 arrayA 中相同
    [arrayC addObject:@2];
    NSLog(@"set = %@", set);
    // set = {((1, 2),(1, 2)}
    // 以上结果在 set 集合中包含两个完全相等的数组，set 中不允许出现次情况，无法保证这点原因就是我们修改了set 中已有对象
    
    // 6 拷贝set
    NSSet *setB = [set copy];
    NSLog(@"setB = %@", setB);
    // setB = {((1, 2)}
    // 结果更糟糕了，剩下一个了，所以建议使用不可变对象
}

@end
////////////////////// 结论 /////////////
/// 1. 检测对象的等同性，请提供‘isEqual’ 和 hash 方法
/// 2. 相同的对象必须具有相同的哈希码，哈希码相同的对象未必相同
/// 3. 编写hash方法时，使用计算速度快并且哈希码碰撞几率低的算法

//
//  EOCPerson+Friendship.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson+Friendship.h"
#import <objc/runtime.h>

/// 分类中声明属性后出现⚠️如下
/*Property 'friends' requires method 'setFriends:' to be defined - use @dynamic or provide a method implementation in this category*/

/// 警告：无法合成‘friends’属性相关的实例变量，需要开发者在分类中为该属性实现存取方法。此时可以把存取方法声明为@dynamic，也就是说通过运行时关联对象的方式提供并实现，编译器目前时看不见的

/// 使用runtime 关联属性的缺点：
/// 1. 相似代码写多变，内存管理上容易出错
/// 2. friends的属性可能会选择可变数组，就需要在设置方法中将传入的数组参数拷贝为可变版本，而此时又成为另外一个编码时容易出错的地方


static const char *kFriendsPropertyKey = "kFriendsPropertyKey";

@implementation EOCPerson (Friendship)

#pragma mark - getter
- (NSArray *)friends {
    return objc_getAssociatedObject(self, kFriendsPropertyKey);
}

#pragma mark - setter
- (void)setFriends:(NSArray *)friends {
    objc_setAssociatedObject(self, kFriendsPropertyKey, friends, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


@end

////////////////////// 结论 /////////////
/// 1. 最正确的做法就是把所有属性都定义在’主接口’中，分类的机制应将其理解为一种手段，g目标在于扩展类的功能，而非封装数据
/// 2. 可以在分类中定义存取方法，（eg: NSCalendar+EOC_Additions 中） 尽量不要定义属性


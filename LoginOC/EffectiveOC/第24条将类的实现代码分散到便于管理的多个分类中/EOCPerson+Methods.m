//
//  EOCPerson+Methods.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson+Methods.h"


@implementation EOCPerson (Methods)

@end


@implementation EOCPerson (Friendship)

- (void)addFriend:(EOCPerson *)person {
    
}
- (void)removeFriend:(EOCPerson *)person {
    
}
- (BOOL)isFriendsWith:(EOCPerson *)person {
    return [self privateFunction];
}

/// Private 私有方法，外界不能访问
- (BOOL)privateFunction {
    return YES;
}

@end


@implementation EOCPerson (Work)

- (void)performDaysWork {
    
}

- (void)takeVacationFromWork {
    
}

@end


@implementation EOCPerson (Play)

- (void)goToTheCinema {
    
}

- (void)goToSportsGame {
    
}

@end


////////////////////// 结论 /////////////
/// 使用分类把类中的代码打散便于管理
/// 便于调试，对于某个分类中的所有方法来说，分类名称都会出现在其符号中，eg：“addfriend:” 方法的”符号名“ （symbol name）是 "-[EOCPerson (Friendship) addFriend:]"
/// 将应该视为’私有‘的方法归入名叫Private 的分类中，隐藏实现细节，例如  "EOCPerson (Friendship)" 方法中 “- (BOOL)privateFunction ” 的方法

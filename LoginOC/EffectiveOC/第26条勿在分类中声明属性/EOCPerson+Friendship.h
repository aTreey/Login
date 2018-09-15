//
//  EOCPerson+Friendship.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson.h"

NS_ASSUME_NONNULL_BEGIN

// 给分类中增加属性
@interface EOCPerson (Friendship)
@property (nonatomic, strong) NSArray *friends;
@end

NS_ASSUME_NONNULL_END

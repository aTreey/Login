//
//  Character.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/5.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/// 定义所有类型共有的一套特征，包括防御、攻击、力量、耐力、敏捷、攻击力
/// character的实例不知道如何把自己构建成有意义的角色，所以才需要 StandardCharacterBuilder基于先前定义的特征关系，构建有意义的角色
@interface Character : NSObject

@property (nonatomic, assign) float protection;
@property (nonatomic, assign) float power;
@property (nonatomic, assign) float strength;
@property (nonatomic, assign) float stamina;
@property (nonatomic, assign) float intelligence;
@property (nonatomic, assign) float agility;
@property (nonatomic, assign) float aggressiveness;

@end

NS_ASSUME_NONNULL_END

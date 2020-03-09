//
//  ChasingGame.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/5.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StandardCharacterBuilder.h"

NS_ASSUME_NONNULL_BEGIN

// 定义了createPlayer:builder 和 createEnemy:builder 方法，
// 通过CharacterBuilder的实例创建游戏者和敌人角色，每个方法有一套不同的特征因子，用来定义角色的特性
// StandardCharacterBuilder是具体的CharacterBuilder，他根据不同的特征因子构建角色。构建结束后将返回Character 实例


@interface ChasingGame : NSObject
// 构建一个游戏着角色，其特征因子都是一套预定义的
- (Character *) createPlayer:(CharacterBuilder *) builder;
- (Character *) createEnemy:(CharacterBuilder *) builder;

@end

NS_ASSUME_NONNULL_END

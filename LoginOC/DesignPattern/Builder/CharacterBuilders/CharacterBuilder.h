//
//  CharacterBuilder.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/6.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

/// 抽象类，定义任何角色生成器都该有的接口
/// 知道究竟如何在缺少是某些特定信息的情况下建造产品
/// 有个 Character 的实例。该 Character 构建完成后将被返回给客户端

@interface CharacterBuilder : NSObject

@property (nonatomic, readonly) Character *character;

/// 定义构建角色的方法

/// 生成要构建的Character新实例
- (CharacterBuilder *) buildNewCharacter;
- (CharacterBuilder *) buildStrength:(float) value;
- (CharacterBuilder *) buildStamina:(float) value;
- (CharacterBuilder *) buildIntelligence:(float) value;
- (CharacterBuilder *) buildAgility:(float) value;
- (CharacterBuilder *) buildAggressiveness:(float) value;

@end

NS_ASSUME_NONNULL_END

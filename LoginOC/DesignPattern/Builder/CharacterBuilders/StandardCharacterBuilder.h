//
//  StandardCharacterBuilder.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/5.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "CharacterBuilder.h"

NS_ASSUME_NONNULL_BEGIN


/// 继承 CharacterBuilder，定义了生成具有各种相关特征的真正角色的逻辑
@interface StandardCharacterBuilder : CharacterBuilder

// 从CharacterBuilder重载的方法
- (CharacterBuilder *) buildStrength:(float) value;
- (CharacterBuilder *) buildStamina:(float) value;
- (CharacterBuilder *) buildIntelligence:(float) value;
- (CharacterBuilder *) buildAgility:(float) value;
- (CharacterBuilder *) buildAggressiveness:(float) value;

@end

NS_ASSUME_NONNULL_END

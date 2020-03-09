//
//  StandardCharacterBuilder.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/5.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "StandardCharacterBuilder.h"

@implementation StandardCharacterBuilder

- (CharacterBuilder *) buildStrength:(float) value
{
  // 防御值
  self.character.protection *= value;
  
  // 攻击力
  self.character.power *= value;
  
  // 最后设定力量返回此生成器
  return [super buildStrength:value];
}

- (CharacterBuilder *) buildStamina:(float) value
{
  // update the protection value of the character
  self.character.protection *= value;
  
  // update the power value of the character
  self.character.power *= value;
  
  // finally set the strength value and return this builder
  return [super buildStamina:value];
}

- (CharacterBuilder *) buildIntelligence:(float) value
{
  // update the protection value of the character
  self.character.protection *= value;
  
  // update the power value of the character
  self.character.power /= value;
  
  // finally set the strength value and return this builder
  return [super buildIntelligence:value];
}

- (CharacterBuilder *) buildAgility:(float) value
{
  // update the protection value of the character
  self.character.protection *= value;
  
  // update the power value of the character
  self.character.power /= value;
  
  // finally set the strength value and return this builder
  return [super buildAgility:value];
}

- (CharacterBuilder *) buildAggressiveness:(float) value
{
  // update the protection value of the character
  self.character.protection /= value;
  
  // update the power value of the character
  self.character.power *= value;
  
  // finally set the strength value and return this builder
  return [super buildAggressiveness:value];
}

@end

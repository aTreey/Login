//
//  CharacterBuilder.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/6.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "CharacterBuilder.h"

@interface CharacterBuilder ()

@property (nonatomic, readwrite) Character *character;

@end

@implementation CharacterBuilder

- (CharacterBuilder *)buildNewCharacter {
    self.character = [[Character alloc] init];
    return self;
}

- (CharacterBuilder *) buildStrength:(float) value {
  self.character.strength = value;
  return self;
}

- (CharacterBuilder *) buildStamina:(float) value
{
  self.character.stamina = value;
  return self;
}

- (CharacterBuilder *) buildIntelligence:(float) value
{
  self.character.intelligence = value;
  return self;
}

- (CharacterBuilder *) buildAgility:(float) value
{
  self.character.agility = value;
  return self;
}

- (CharacterBuilder *) buildAggressiveness:(float) value
{
  self.character.aggressiveness = value;
  return self;
}

- (void) dealloc {
  
}

@end

//
//  ChasingGame.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/5.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "ChasingGame.h"

@implementation ChasingGame

- (Character *)createPlayer:(CharacterBuilder *)builder {
    [builder buildNewCharacter];
    [builder buildStrength:80];
    [builder buildStamina:65.0];
    [builder buildIntelligence:35.0];
    [builder buildAgility:25.0];
    [builder buildAggressiveness:95.0];
    return [builder character];
}

- (Character *)createEnemy:(CharacterBuilder *)builder {
    [builder buildNewCharacter];
    [builder buildStrength:80.0];
    [builder buildStamina:65.0];
    [builder buildIntelligence:35.0];
    [builder buildAgility:25.0];
    [builder buildAggressiveness:95.0];
    return [builder character];
}

@end

//
//  Card.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/10.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Card.h"

@implementation Card

- (NSInteger)match:(NSArray *)otherCards {
    NSInteger score = 0;

    for (Card *card in otherCards) {
        if ([card.content isEqualToString:self.content]) {
            score = 1;
        }
    }

    return score;
}

@end

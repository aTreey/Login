//
//  PlayingCard.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/11.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSInteger)match:(NSArray *)otherCards {
    NSInteger score = 0;
    if (otherCards.count == 1) {
        PlayingCard *otherCard = otherCards.firstObject;
        if (otherCard.suit == self.suit) {
            score = 1;
        }
        if (otherCard.rank == [self rank]) {
            score = 4;
        }
    }
    
    if (otherCards.count == 2) {
        PlayingCard *card0 = [otherCards objectAtIndex:0];
        PlayingCard *card1 = [otherCards objectAtIndex:1];
        
        if (card0.suit == card1.suit && card0.suit == self.suit) {
            score = 1;
        } else if (card0.suit == card1.suit || card0.suit == self.suit || card1.suit == self.suit){
            score = 1;
        }
        if (card0.rank == card1.rank && card0.rank == self.rank) {
            score = 20;
        } else if (card0.rank == card1.rank || card0.rank == self.rank || card1.rank == self.rank){
            score = 1;
        }
    }
    
    return score;
}

- (NSString *)content {
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"";
}

+ (NSArray *)validSuits {
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3",@"4", @"5",@"6", @"7",@"8",@"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank {
    return [self rankStrings].count - 1;
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end

//
//  CardMatchingGame.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/14.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic, assign, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

static const int DOUBLE_MODE = 0;
static const int TRIPPLE_MODE = 1;
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck {
    self = [super init];
    if (self) {
        for (NSInteger i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (void)chooseCardAtIndex:(NSUInteger)index {
    Card *card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    NSInteger matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore;
                        card.match = YES;
                        otherCard.match = YES;
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index {
    if (index < self.cards.count) {
        return self.cards[index];
    }
    return nil;
}

- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [NSMutableArray array];
    }
    return _cards;
}

@end

//
//  PlayingCard.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/11.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card

@property (nonatomic,   copy) NSString *suit;
@property (nonatomic, assign) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

NS_ASSUME_NONNULL_END

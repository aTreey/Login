//
//  Deck.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/10.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"


NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end

NS_ASSUME_NONNULL_END

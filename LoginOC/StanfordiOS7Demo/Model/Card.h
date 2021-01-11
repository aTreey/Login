//
//  Card.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/10.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (nonatomic,   copy) NSString *content;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL match;

- (NSInteger)match:(NSArray *)otherCards;

@end

NS_ASSUME_NONNULL_END

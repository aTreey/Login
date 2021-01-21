//
//  PlayingCardView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/20.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "CardView.h"

NS_ASSUME_NONNULL_BEGIN

static const CGFloat CARD_VIEW_CORNER_FONT_STANDARD_HEIGHT = 180.0;
static const CGFloat CARD_VIEW_CORNER_RADIUS = 12.0;
static const CGFloat CARD_VIEW_RATIO = 5.0 / 8.0;
static const CGFloat CARD_VIEW_DEFAULT_SCALEFACTOR = 0.9;


@interface PlayingCardView : CardView

@property (nonatomic, assign) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic, assign) BOOL faceUp;

- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end

NS_ASSUME_NONNULL_END

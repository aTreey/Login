//
//  PlayingCardView.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/20.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "PlayingCardView.h"

@interface PlayingCardView ()

@property (nonatomic, assign) CGFloat faceCardScaleFactor;

@end


@implementation PlayingCardView

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

#pragma mark - Public Methods

- (void)pinch:(UIPinchGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateChanged ||
        gesture.state == UIGestureRecognizerStateEnded) {
        self.faceCardScaleFactor *= gesture.scale;
        gesture.scale = 1.0;
    }
}

- (void)setup {
    self.backgroundColor = nil;
    self.opaque = NO;
    // bounds 改变时，调用drawRect重绘制
    self.contentMode = UIViewContentModeRedraw;
}

- (CGFloat)cornerScaleFactor {
    return self.bounds.size.height / CARD_VIEW_CORNER_FONT_STANDARD_HEIGHT;
}

- (CGFloat)cornerRadius {
    return CARD_VIEW_CORNER_RADIUS * [self cornerScaleFactor];
}

- (CGFloat)cornerOffset {
    return [self cornerRadius] / 3.0;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *roundReact = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                    cornerRadius:[self cornerRadius]];
    // 可见区域就变成了它的“fill area”，接下来的绘制，如果在这个区域外都会被无视。
    [roundReact addClip];
    
    [[UIColor whiteColor] setFill];
    UIRectFill(self.bounds);
    
    [[UIColor blackColor] setStroke];
    [roundReact stroke];
    
    if (self.faceUp) {
        UIImage *faceImage = [UIImage imageNamed:@"downarr"];
        if (faceImage) {
            CGRect imageRect = CGRectInset(self.bounds, self.bounds.size.width * (1.0 - self.faceCardScaleFactor), self.bounds.size.height * (1.0 - self.faceCardScaleFactor));
            [faceImage drawInRect:imageRect];
        } else {
            [self drawPips];
        }
    } else {
        [[UIImage imageNamed:@"defaultAppIcon"] drawInRect:self.bounds];
    }
    
    
    [self drawCorners];
}

#pragma mark - Private Methods

- (NSString *)rankStrings {
    return @[@"?", @"A", @"2", @"3",@"4", @"5",@"6", @"7",@"8",@"9", @"10", @"J", @"Q", @"K"][self.rank];
}

- (void)drawPips {
    
}

- (void)drawCorners {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSAttributedString *cornerText = [[NSAttributedString alloc] initWithString:@"A ☯︎"
                                                                     attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];
    CGRect textBounds;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    textBounds.size = [cornerText size];
    [cornerText drawInRect:textBounds];
    
    CGContextRef contenxt = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(contenxt, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(contenxt, M_PI);
    
    [cornerText drawInRect:textBounds];
}

- (CGFloat)faceCardScaleFactor {
    if (!_faceCardScaleFactor) {
        _faceCardScaleFactor = CARD_VIEW_DEFAULT_SCALEFACTOR;
    }
    return _faceCardScaleFactor;
}

- (void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor {
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

-(void)setRank:(NSUInteger)rank {
    _rank = rank;
    // 标记为需要重绘，异步调用drawRect
    [self setNeedsDisplay];
}

- (void)setSuit:(NSString *)suit {
    _suit = suit;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

@end

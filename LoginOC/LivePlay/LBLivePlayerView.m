//
//  LBLivePlayerView.m
//  LoginOC
//
//  Created by yhp on 2018/4/7.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LBLivePlayerView.h"
#import "lBLivePlayerManager.h"

@interface LBLivePlayerView()
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) UIButton *closeButton;

@end

@implementation LBLivePlayerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
        self.url = [lBLivePlayerManager sharedInstance].liveUrl;
        [self setupUI];
        
    }
    return self;
}

- (void)closeButtonAction {
    [[lBLivePlayerManager sharedInstance] shutDown];
    [self removeFromSuperview];
}

- (void)setupUI {
    [self addSubview:[lBLivePlayerManager sharedInstance].livePlayer.view];
    [lBLivePlayerManager sharedInstance].livePlayer.view.frame = self.bounds;
    
    UIPanGestureRecognizer *dragGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragGestureRecognizer:)];
    dragGesture.minimumNumberOfTouches = 1;
    dragGesture.maximumNumberOfTouches = 1;
    [self addGestureRecognizer:dragGesture];
    
    [self addSubview:self.closeButton];
    self.closeButton.frame = CGRectMake(self.bounds.size.width - 50, 0, 50, 50);
    self.closeButton.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    [self bringSubviewToFront:self.closeButton];
    
}

- (void)dragGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer {
    CGPoint point = [gestureRecognizer translationInView:[[UIApplication sharedApplication] keyWindow]];
    gestureRecognizer.view.center = CGPointMake(gestureRecognizer.view.center.x + point.x, gestureRecognizer.view.center.y + point.y);
    [gestureRecognizer setTranslation:CGPointMake(0, 0) inView:[[UIApplication sharedApplication] keyWindow]];
}

- (UIButton *)closeButton{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setTitle:@"X" forState:UIControlStateNormal];
        [_closeButton setBackgroundColor:[UIColor redColor]];
        [_closeButton addTarget:self action:@selector(closeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

@end

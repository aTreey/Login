//
//  lBLivePlayerManager.m
//  LoginOC
//
//  Created by liepin on 2018/4/7.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "lBLivePlayerManager.h"
#import "NELivePlayerController.h"

@interface lBLivePlayerManager ()

/**
 返回按钮
 */
@property (nonatomic, strong) UIButton *backButton;

/**
 屏幕切换按钮
 */
@property (nonatomic, strong) UIButton *orientationButton;

/**
 关闭按钮
 */
@property (nonatomic, strong) UIButton *closeButton;

/**
 加载提示
 */
@property (nonatomic, strong) UILabel* lodingTextLabel;
@end

@implementation lBLivePlayerManager

static lBLivePlayerManager *instance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)closeButtonAction {
    NSLog(@"closeButtonAction");
}


- (void)shutDown{
    [self.livePlayer shutdown];
    [self.livePlayer.view removeFromSuperview];
    self.livePlayer = nil;
    _liveUrl = @"";
}


- (void)setLiveUrl:(NSString *)liveUrl {
    _liveUrl = liveUrl;
    [self setupLiverPlayer];
}


- (void)setupLiverPlayer {
    NSError *error = nil;
    self.livePlayer = [[NELivePlayerController alloc] initWithContentURL:[NSURL URLWithString:self.liveUrl]
                                                  needConfigAudioSession:NO
                                                                   error:&error];
    
    if (self.livePlayer == nil || error) {
        NSLog(@"error = %@", error);
    }
    
    self.livePlayer.view.frame = CGRectMake(0, 64, CGRectGetWidth([UIScreen mainScreen].bounds), 210);
    self.livePlayer.view.backgroundColor = [UIColor blackColor];
    [self.livePlayer setBufferStrategy:NELPLowDelay];
    [self.livePlayer setScalingMode:NELPMovieScalingModeNone];
    [self.livePlayer setShouldAutoplay:YES];
    [self.livePlayer setHardwareDecoder:YES];
    [self.livePlayer setPauseInBackground:NO];
    [self.livePlayer prepareToPlay];
}



@end

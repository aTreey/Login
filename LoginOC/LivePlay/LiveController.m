//
//  LiveController.m
//  LoginOC
//
//  Created by liepin on 2018/4/7.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "LiveController.h"

#import "NELivePlayerController.h"
#import "AppDelegate+SuspendedPlay.h"
#import "lBLivePlayerManager.h"


@interface LiveController ()
@property (nonatomic, strong) NELivePlayerController *player; //播放器sdk
@property (nonatomic, strong) NSURL *url; //播放器sdk
@end

@implementation LiveController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _url = [NSURL URLWithString:@"rtmp://live.hkstv.hk.lxdns.com/live/hks"];
    [self doInitPlayer];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.player shutdown];
}


#pragma mark - 播放器SDK功能
- (void)doInitPlayer {
    NSError *error = nil;
    self.player = [[NELivePlayerController alloc] initWithContentURL:_url error:&error];
    self.player.view.frame = self.view.bounds;
    [self.view addSubview:self.player.view];
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.view.autoresizesSubviews = YES;
    
    [self.player setScalingMode:NELPMovieScalingModeNone]; // 设置画面显示模式，默认原始大小
    [self.player setShouldAutoplay:YES]; // 设置prepareToPlay完成后是否自动播放
//    [self.player setHardwareDecoder:_isHardware]; // 设置解码模式，是否开启硬件解码
    [self.player setPauseInBackground:NO]; // 设置切入后台时的状态，暂停还是继续播放
    [self.player setPlaybackTimeout:15 *1000]; // 设置拉流超时时间
    [self.player prepareToPlay];
    
    [lBLivePlayerManager sharedInstance].liveUrl = self.url.absoluteString;
}

- (void)dealloc {
    NSLog(@"LiveController dealloc");
    [[NSNotificationCenter defaultCenter] postNotificationName:SuspendPlayNotificationName object:nil];
}

@end

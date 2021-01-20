//
//  AppDelegate+SuspendedPlay.m
//  LoginOC
//
//  Created by yhp on 2018/4/7.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "AppDelegate+SuspendedPlay.h"
#import "LBLivePlayerView.h"

NSString *const SuspendPlayNotificationName = @"SuspendPlayNotificationName";


@implementation AppDelegate (SuspendedPlay)

- (void)registerSuspendedPlayNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showSuspendedPlay) name:SuspendPlayNotificationName object:nil];
}

- (void)showSuspendedPlay {
    CGRect frame = CGRectMake(0, 100, self.window.bounds.size.width * 0.5, self.window.bounds.size.width * 0.6/2);
    LBLivePlayerView *playView = [[LBLivePlayerView alloc] initWithFrame:frame];
    [self.window addSubview:playView];
}

@end

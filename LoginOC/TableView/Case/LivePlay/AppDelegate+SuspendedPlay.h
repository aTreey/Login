//
//  AppDelegate+SuspendedPlay.h
//  LoginOC
//
//  Created by yhp on 2018/4/7.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "AppDelegate.h"

extern NSString *const SuspendPlayNotificationName;


@interface AppDelegate (SuspendedPlay)


- (void)registerSuspendedPlayNotification;
- (void)showSuspendedPlay;
@end

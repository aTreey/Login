//
//  lBLivePlayerManager.h
//  LoginOC
//
//  Created by liepin on 2018/4/7.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NELivePlayer.h"

@protocol lBLivePlayerManagerDelegate <NSObject>

@end


@interface lBLivePlayerManager : NSObject

@property (nonatomic, weak) id <lBLivePlayerManagerDelegate> delegate;

/**
 直播播放器
 */
@property(nonatomic, strong) id<NELivePlayer> livePlayer;

/**
 播放url
 */
@property (nonatomic, copy) NSString* liveUrl;

+ (instancetype)sharedInstance;
- (void)shutDown;
@end

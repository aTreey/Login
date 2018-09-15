//
//  EOCLoginManager.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

// 登陆通知名称
extern NSString *const EOCLoginManagerDidLoginNotification;

@interface EOCLoginManager : NSObject
- (void)login;
@end

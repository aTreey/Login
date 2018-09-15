//
//  EOCLoginManager.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCLoginManager.h"

NSString *const EOCLoginManagerDidLoginNotification = @"EOCLoginManagerDidLoginNotification";

@implementation EOCLoginManager
- (void)login {
    
}

// private method
- (void)p_didLogin {
    [[NSNotificationCenter defaultCenter] postNotificationName:EOCLoginManagerDidLoginNotification object:nil];
}
@end

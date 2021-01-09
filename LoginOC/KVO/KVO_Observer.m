//
//  KVO_Observer.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/6.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "KVO_Observer.h"
#import "KVO_Test.h"

@implementation KVO_Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if ([object isKindOfClass:[KVO_Test class]] && [keyPath isEqualToString:@"value"]) {
        // 获取新值
        NSNumber *number = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value is %@", number);
    }
}

@end

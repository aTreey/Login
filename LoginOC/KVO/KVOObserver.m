//
//  KVOObserver.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/5.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "KVOObserver.h"
#import "KVOObject.h"


@implementation KVOObserver

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([object isKindOfClass:KVOObject.class] && [keyPath isEqualToString:@"value"]) {
        NSNumber *newValue = [change valueForKey:NSKeyValueChangeNewKey];
        NSLog(@"value is = %@", newValue);
    }
}

@end

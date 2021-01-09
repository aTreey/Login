//
//  BusinessObject.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/1/9.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "BusinessObject.h"

@implementation BusinessObject

// 责任链入口
- (void)handle:(ResultBlock)result {
    CompletionBlock completion = ^(BOOL handle) {
        if (handle) {
            result(self, handle);
        } else {
            // 沿着责任链，指派给下一个业务处理
            if (self.nextBusiness) {
                [self.nextBusiness handle:result];
            } else {
                // 下一个业务为空，没有业务需要处理
                result(nil, NO);
            }
        }
    };
    
    
    // 当前业务进行处理
    [self handleBusiness:completion];
}

// 处理具体的业务逻辑
- (void)handleBusiness:(CompletionBlock)completion {
    
}

@end

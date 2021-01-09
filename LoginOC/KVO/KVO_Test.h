//
//  KVO_Test.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/6.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KVO_Test : NSObject
@property (nonatomic, assign) NSInteger value;

@property (nonatomic, assign) id obj;

- (void)increase;
@end

NS_ASSUME_NONNULL_END

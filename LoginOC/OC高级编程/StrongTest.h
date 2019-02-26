//
//  StrongTest.h
//  LoginOC
//
//  Created by HongpengYu on 2019/1/13.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StrongTest : NSObject

{
    id __strong obj_;
}

- (void)setObject:(id __strong)obj;

@end


@interface StrongCycleTest: NSObject


@end


@interface Unsafe_unRetainedTest: NSObject


@end

NS_ASSUME_NONNULL_END

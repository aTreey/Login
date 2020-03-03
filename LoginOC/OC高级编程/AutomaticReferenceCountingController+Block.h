//
//  AutomaticReferenceCountingController+Block.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/10.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController.h"

NS_ASSUME_NONNULL_BEGIN

typedef int(^ForwardingBlock)(int);

@interface AutomaticReferenceCountingController (Block)
- (void)test_block;
- (void)test__Block3;
- (void)test__Block4;

@property (nonatomic, copy) ForwardingBlock blk;
@property (nonatomic, copy) int(^blk1)(int);
@end

NS_ASSUME_NONNULL_END

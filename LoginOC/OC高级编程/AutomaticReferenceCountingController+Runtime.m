//
//  AutomaticReferenceCountingController+Runtime.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/8.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController+Runtime.h"
#import "RunTimeObject.h"

@implementation AutomaticReferenceCountingController (Runtime)

- (void)runTiemTest {
    RunTimeObject *obj = [[RunTimeObject alloc] init];
    [obj test];
}
@end

//
//  AutomaticReferenceCountingController+CategoryAddProperty.h
//  LoginOC
//
//  Created by HongpengYu on 2019/4/12.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AutomaticReferenceCountingController (AddProperty)

@property (nonatomic, copy) NSString *associateProperty;

- (void)test_associateProperty;
@end

NS_ASSUME_NONNULL_END

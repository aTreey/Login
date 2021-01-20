//
//  FormRowProtocol.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/21.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FormRow;

NS_ASSUME_NONNULL_BEGIN

@protocol FormRowProtocol <NSObject>

@required

@property (nonatomic, weak) FormRow *rowDescriptor;

- (void)update;

@end

NS_ASSUME_NONNULL_END

//
//  Prototype_Student.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PrototypeCopyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Prototype_Student : NSObject<PrototypeCopyProtocol>

@property (nonatomic,   copy) NSString *name;
@property (nonatomic,   copy) NSString *address;
@property (nonatomic, strong) NSNumber *age;
@property (nonatomic, strong) NSNumber *totalScore;

@end

NS_ASSUME_NONNULL_END

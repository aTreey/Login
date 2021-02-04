//
//  Prototype_CopyObject.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Prototype_BaseCopyObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface Prototype_CopyObject : Prototype_BaseCopyObject

@property (nonatomic,   copy) NSString *name;
@property (nonatomic,   copy) NSString *address;
@end

NS_ASSUME_NONNULL_END

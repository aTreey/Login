//
//  Wheel.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/5.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderProtocol.h"
#import "AbstractWheels.h"


NS_ASSUME_NONNULL_BEGIN

@interface Wheel : NSObject <BuilderProtocol, AbstractWheels>

@end

NS_ASSUME_NONNULL_END

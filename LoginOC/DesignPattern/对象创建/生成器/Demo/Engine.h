//
//  Engine.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/4.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderProtocol.h"
#import "AbstractEngine.h"


NS_ASSUME_NONNULL_BEGIN

@interface Engine : NSObject <BuilderProtocol, AbstractEngine>

@end

NS_ASSUME_NONNULL_END

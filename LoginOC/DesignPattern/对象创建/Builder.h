//
//  Builder.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/4.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BuilderProtocol.h"
#import "AbstractEngine.h"
#import "AbstractWheels.h"
#import "AbstractDoors.h"


NS_ASSUME_NONNULL_BEGIN

@interface Builder : NSObject

@property (nonatomic, strong) id <BuilderProtocol, AbstractEngine> engine;
@property (nonatomic, strong) id <BuilderProtocol, AbstractWheels> wheel;
@property (nonatomic, strong) id <BuilderProtocol, AbstractDoors> door;


/// 产品信息
@property (nonatomic, strong) NSDictionary *productsInfo;

/// 构建所有部件
- (void)buildAllParts;

@end

NS_ASSUME_NONNULL_END

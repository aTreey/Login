//
//  Builder.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/4.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Builder.h"

@implementation Builder

- (void)buildAllParts {
    // 创建部件
    [self.engine build];
    [self.wheel build];
    [self.door build];
    
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    
    //
    data[@"engine"] = [self.engine engineInfo];
    data[@"wheel"] = [self.wheel wheelsInfo];
    data[@"door"] = [self.door doorInfo];
    
    self.productsInfo = data;
}

@end

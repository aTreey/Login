//
//  Prototype_CopyObject2.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Prototype_CopyObject2.h"

@implementation Prototype_CopyObject2

- (void)copyOperationWithObj:(Prototype_CopyObject2 *)obj {
    obj.name = self.name;
    obj.objs = self.objs;
    
    // 深copy
    obj.objs = [[NSArray alloc] initWithArray:self.objs copyItems:YES];
}

@end

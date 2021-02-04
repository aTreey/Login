//
//  Prototype_CopyObject.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/2.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "Prototype_CopyObject.h"

@implementation Prototype_CopyObject

- (void)copyOperationWithObj:(Prototype_CopyObject *)obj {
    obj.name = self.name;
    obj.address = self.address;
}

@end

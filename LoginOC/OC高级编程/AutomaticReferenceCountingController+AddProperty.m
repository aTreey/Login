//
//  AutomaticReferenceCountingController+CategoryAddProperty.m
//  LoginOC
//
//  Created by HongpengYu on 2019/4/12.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "AutomaticReferenceCountingController+AddProperty.h"
#import <objc/runtime.h>


static void *propertyKey = "propertyKey";
@implementation AutomaticReferenceCountingController (AddProperty)

- (void)setAssociateProperty:(NSString *)associateProperty {
    objc_setAssociatedObject(self, propertyKey, associateProperty, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


- (NSString *)associateProperty {
    return objc_getAssociatedObject(self, propertyKey);
}


- (void)test_associateProperty {
    
    self.associateProperty = @"associateProperty";
}


@end

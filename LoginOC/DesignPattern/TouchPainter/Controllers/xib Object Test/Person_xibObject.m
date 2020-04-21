//
//  Person_xibObject.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/29.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "Person_xibObject.h"

@implementation Person_xibObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"666");
    }
    return self;
}

- (IBAction)eat:(id)sender {
    NSLog(@"person eat");
}

@end

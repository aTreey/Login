//
//  AppleFactory.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/1.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "AppleFactory.h"
#import "iPhone.h"
#import "iWatch.h"


@implementation AppleFactory

- (BasePhone *)creatPhone {
    return [[iPhone alloc] init];
}

- (BaseWatch *)creatWatch {
    return [[iWatch alloc] init];
}

@end

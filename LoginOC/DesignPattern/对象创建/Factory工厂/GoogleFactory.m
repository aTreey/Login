//
//  GoogleFactory.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2021/2/1.
//  Copyright © 2021 于鸿鹏. All rights reserved.
//

#import "GoogleFactory.h"
#import "AndroidWatch.h"
#import "Android.h"

@implementation GoogleFactory

- (BasePhone *)creatPhone {
    return [[Android alloc] init];
}

- (BaseWatch *)creatWatch {
    return [[AndroidWatch alloc] init];
}

@end

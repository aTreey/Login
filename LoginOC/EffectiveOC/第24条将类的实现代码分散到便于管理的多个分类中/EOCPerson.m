//
//  EOCPerson.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson.h"

@implementation EOCPerson

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName {
    if (self = [super init]) {
        _firstName = firstName;
        _lastName = lastName;
    }
    return self;
}

@end

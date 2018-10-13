//
//  EOCSmithPerson.m
//  LoginOC
//
//  Created by HongpengYu on 2018/10/13.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCSmithPerson.h"

@implementation EOCSmithPerson

- (void)setLastName:(NSString *)lastName {
    if (![lastName isEqualToString:@"Smith"]) {
        [NSException raise:NSInvalidArgumentException format:@"Last name must be Smith"];
    }
    
    self.lastName = lastName;
}

@end

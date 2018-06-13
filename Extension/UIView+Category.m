//
//  UIView+Category.m
//  LoginOC
//
//  Created by liepin on 2018/3/28.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "UIView+Category.h"

@implementation UIView (Category)

- (UIViewController*)viewController {
    UIResponder *nextResponder =  self;
    do
    {
        nextResponder = [nextResponder nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}

@end

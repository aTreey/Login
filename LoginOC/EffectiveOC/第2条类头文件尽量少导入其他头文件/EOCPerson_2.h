//
//  EOCPerson_2.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

// 向前声明： 告诉编译器有这个名叫 EOCEmployer_2的类就好
@class EOCEmployer_2;

@interface EOCPerson_2 : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) EOCEmployer_2 *employer;

@end

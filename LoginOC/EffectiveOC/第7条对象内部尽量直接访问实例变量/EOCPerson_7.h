//
//  EOCPerson_7.h
//  LoginOC
//
//  Created by HongpengYu on 2018/10/3.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>


@class EOCBrain;

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson_7 : NSObject
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) EOCBrain *brain;


// 便利方法
- (NSString *)fullName;
- (void)setFullName:(NSString *)fullName;
@end

NS_ASSUME_NONNULL_END

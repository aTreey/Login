//
//  EOCDatabaseManager.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//  数据库处理器

#import <Foundation/Foundation.h>

@protocol EOCDatabaseConnection;

@interface EOCDatabaseManager : NSObject
+ (instancetype)sharedInstance;

// 处理数据库链接所用的类的具体名称不会被泄露，可能会来自不同的框架，但是他们都遵守了 EOCDatabaseConnection 协议
- (id<EOCDatabaseConnection>)connectionWithIdentifier:(NSString *)identifier;
@end

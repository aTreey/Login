//
//  ConnectionManager.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/12/1.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 请求成功回调
 */
typedef void(^HttpRequestSuccess)(id response);

/**
 请求失败回调
 */
typedef void(^HttpRequestFailed)(NSError *error, id response);

@interface HttpConnectionManager : NSObject

+ (instancetype)sharedInstance;

- (NSString *)request:(NSString *)URL
               method:(NSString*)method
           parameters:(nullable id)parameters
        customHeaders:(nullable NSDictionary *)headers
           cacheFirst:(BOOL)cacheFirst
              success:(HttpRequestSuccess)success
              failure:(HttpRequestFailed)failure;

@end

NS_ASSUME_NONNULL_END

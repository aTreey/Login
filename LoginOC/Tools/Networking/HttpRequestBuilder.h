//
//  RequestBuilder.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/12/6.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HttpRequestBuilder : NSObject

+ (NSMutableURLRequest*)createRequestWithURLString:(NSString *)URLString method:(NSString *)method parameters:(nullable id)parameters;

@end

NS_ASSUME_NONNULL_END

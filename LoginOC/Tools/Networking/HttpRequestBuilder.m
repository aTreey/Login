//
//  RequestBuilder.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/12/6.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "HttpRequestBuilder.h"

@implementation HttpRequestBuilder

+ (NSMutableURLRequest*)createRequestWithURLString:(NSString *)URLString method:(NSString *)method parameters:(nullable id)parameters {
    
    NSParameterAssert(URLString);
    NSParameterAssert(method);
    
    NSMutableString *mutableUrlString = [URLString mutableCopy];
    NSString *uppercaseMethod = [method uppercaseString];
    
    // 处理参数
    BOOL parametersInRequestBody = YES;
    if ([uppercaseMethod isEqualToString:@"GET"] || [uppercaseMethod isEqualToString:@"HEAD"]) {
        if (parameters && [parameters isKindOfClass:[NSDictionary class]] && [parameters allKeys].count > 0) {
            if (![mutableUrlString containsString:@"?"]) {
                [mutableUrlString appendString:@"?"];
            } else {
                [mutableUrlString appendString:@"&"];
            }
            NSInteger i = 0;
            for (NSString *key in [parameters allKeys]) {
                if (i > 0) {
                    [mutableUrlString appendString:@"&"];
                }
                NSString *value = parameters[key];
//                [mutableUrlString appendFormat:@"%@=%@", [self urlEncode:key], [self urlEncode:[value description]]];
                i ++;
            }
        }
        parametersInRequestBody = NO;
    }
    
    /** 设置URL 缓存策略、超时时间
     
     默认策略，具体的缓存逻辑和协议的声明有关，如果协议没有声明，不需要每次重新验证cache。    如果请求协议头为no-cache，则表现为直接从后台请求数据
     NSURLRequestUseProtocolCachePolicy = 0,
     
     忽略本地缓存，直接从后台请求数据
     NSURLRequestReloadIgnoringLocalCacheData = 1,
     
     忽略本地缓存数据、代理和其他中介的缓存，直接从后台请求数据
     NSURLRequestReloadIgnoringLocalAndRemoteCacheData = 4,
     NSURLRequestReloadIgnoringCacheData = NSURLRequestReloadIgnoringLocalCacheData,

     优先从本地拿数据，且忽略请求生命时长和过期时间。但是如果没有本地cache，则请求源数据
     NSURLRequestReturnCacheDataElseLoad = 2,
     
     只从本地拿数据
     NSURLRequestReturnCacheDataDontLoad = 3,
     
     每次必须重新验证cache
     NSURLRequestReloadRevalidatingCacheData = 5,
     
    */
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:mutableUrlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    request.HTTPMethod = uppercaseMethod;
    
    // 配置请求报文
    [request setValue:[self createUserAgent] forHTTPHeaderField:@"User-Agent"];
    
    if (parametersInRequestBody) {
        if (parameters) {
            if (![request valueForHTTPHeaderField:@"Content-Type"]) {
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            }
            
            NSData *jsonData = nil;
            if ([parameters isKindOfClass:[NSString class]]) {
                jsonData = [(NSString *)parameters dataUsingEncoding:NSUTF8StringEncoding];
            } else {
                NSError *error = nil;
                if (![NSJSONSerialization isValidJSONObject:parameters]) {
                    NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey: NSLocalizedStringFromTable(@"The `parameters` argument is not valid JSON.", @"Request", nil)};
                    error = [[NSError alloc] initWithDomain:@"Request" code:NSURLErrorCannotDecodeContentData userInfo:userInfo];
                } else {
                    jsonData = [NSJSONSerialization dataWithJSONObject:parameters options:0 error:nil];
                }
            }
            
            if (jsonData) {
                [request setHTTPBody:jsonData];
            }
        }
    }
    return request;
}

+ (NSString *)createUserAgent {
    NSDictionary *appInfo = [[NSBundle mainBundle] infoDictionary];
    NSString *userAgent = [NSString stringWithFormat:@"%@/%@ (%@; iOS %@; Scale/%0.2f)",
                           appInfo[(__bridge NSString *)kCFBundleIdentifierKey],
                           appInfo[@"CFBundleShortVersionString"],
                           [[UIDevice currentDevice] model],
                           [[UIDevice currentDevice] systemVersion],
                           [[UIScreen mainScreen] scale]];
    return userAgent;
}

@end

//
//  ConnectionManager.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/12/1.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "HttpConnectionManager.h"
#import "HttpRequestBuilder.h"


@interface HttpConnectionManager() <NSURLSessionTaskDelegate>

@property (nonatomic, strong) NSMutableDictionary *taskDatas;
// session config, 设置
/**
 
 */
@property (nonatomic, strong) NSURLSession *defaultSession;

/**
 串行队列，保证回调的正确顺序，处理请求返回的结果，如果为nil，会创建一个
 */
@property (nonatomic, strong) NSOperationQueue *operationQueue;



@end

@implementation HttpConnectionManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static HttpConnectionManager *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.taskDatas = [NSMutableDictionary dictionary];
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
        
        /**
         设置Session配置，如缓存策略、超时、代理、管道、要支持的TLS版本、cookie策略、凭据存储等。默认缓存是使用磁盘缓存
         */
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:self.operationQueue];
    }
    return self;
}

- (NSString *)request:(NSString *)URL method:(NSString *)method parameters:(nullable id)parameters customHeaders:(nullable NSDictionary *)headers cacheFirst:(BOOL)cacheFirst success:(HttpRequestSuccess)success failure:(HttpRequestFailed)failure {
    
    NSMutableURLRequest *mutableRequest = [HttpRequestBuilder createRequestWithURLString:URL method:method parameters:parameters];
    
    if (headers) {
        for (NSString *key in headers) {
            [mutableRequest setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    
    if (!mutableRequest) {
        return nil;
    }
    
    // 设置cache
    mutableRequest.cachePolicy = NSURLCacheStorageAllowed;
    
    NSURLSessionTask *task = [self.defaultSession dataTaskWithRequest:mutableRequest];
    NSString *taskKey = [self getTaskKeyForTask:task];
    return taskKey;
}


- (NSString *)getTaskKeyForTask: (NSURLSessionTask*)task {
    return [NSString stringWithFormat:@"%lu", task.taskIdentifier];
}

@end

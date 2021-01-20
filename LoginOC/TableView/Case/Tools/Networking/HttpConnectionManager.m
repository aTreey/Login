//
//  ConnectionManager.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/12/1.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "HttpConnectionManager.h"
#import "HttpRequestBuilder.h"


#define MAX_TASK_COUNT      3
#define PrintLog           YES


static NSString * const HttpConnectionSessionManagerLockName = @"HTTP.networking.session.manager.lock";

@interface HttpTaskContext: NSObject

/// success callback
@property (nonatomic, copy) HttpRequestSuccess success;

/// failure callback
@property (nonatomic, copy) HttpRequestFailed failure;

/// task
@property (nonatomic, strong) NSURLSessionTask *task;

///
@property (nonatomic, assign) NSUInteger excuteCount;

/// 下一次请求时间
@property (nonatomic, assign) NSTimeInterval nextExcuteTime;

/// 请求创建时间
@property (nonatomic, assign) NSTimeInterval createTime;

/// urlsession
@property (nonatomic, weak) NSURLSession *session;

/// 是否忽略https
@property (nonatomic, assign) BOOL ignoreHttps;

@end

@implementation HttpTaskContext

@end


@interface HttpConnectionManager() <NSURLSessionTaskDelegate, NSURLSessionDataDelegate>

@property (nonatomic, strong) NSMutableDictionary *taskDatas;

/**
 session config, 设置
 */
@property (nonatomic, strong) NSURLSession *defaultSession;

/**
 串行队列，保证回调的正确顺序，处理请求返回的结果，如果为nil，会创建一个
 */
@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSMutableDictionary *taskContext;
@property (nonatomic, strong) NSMutableDictionary *cachedDatas;
@property (nonatomic, strong) NSMutableArray *mutableTasks;
@property (readwrite, nonatomic, strong) NSLock *lock;
@property (nonatomic, assign) NSUInteger runningTaskCount;

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
        self.cachedDatas = [NSMutableDictionary dictionary];
        self.taskDatas = [NSMutableDictionary dictionary];
        self.taskContext = [NSMutableDictionary dictionary];
        self.mutableTasks = [NSMutableArray array];
        self.operationQueue = [[NSOperationQueue alloc] init];
        self.operationQueue.maxConcurrentOperationCount = 1;
        
        // 使用 NSLock 性能较好，防止多线程问题
        self.lock = [[NSLock alloc] init];
        self.lock.name = HttpConnectionSessionManagerLockName;
        
        NSURLCache *cache = [self defaultURLCache];
        [NSURLCache setSharedURLCache:cache];
        
        /**
         设置Session配置，如缓存策略、超时、代理、管道、要支持的TLS版本、cookie策略、凭据存储等。默认缓存是使用磁盘缓存
         */
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.defaultSession = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:self.operationQueue];
    }
    return self;
}

- (NSString *)request:(NSString *)URL
               method:(NSString *)method
           parameters:(nullable id)parameters
        customHeaders:(nullable NSDictionary *)headers
           cacheFirst:(BOOL)cacheFirst
              success:(HttpRequestSuccess)success
              failure:(HttpRequestFailed)failure {
    
    NSMutableURLRequest *mutableRequest = nil;
    
    [self.lock lock];
    mutableRequest = [HttpRequestBuilder createRequestWithURLString:URL method:method parameters:parameters];
    if (headers) {
        for (NSString *key in headers) {
            [mutableRequest setValue:headers[key] forHTTPHeaderField:key];
        }
    }
    [self.lock unlock];
    
    if (!mutableRequest) {
        return nil;
    }
    
    // 设置cache
    mutableRequest.cachePolicy = NSURLCacheStorageAllowed;
    
    // 设置缓存
    BOOL isCacheData = NO;
    
    [self.lock lock];
    NSCachedURLResponse *cachedResponse = [[NSURLCache sharedURLCache] cachedResponseForRequest:mutableRequest];
    [self.lock unlock];
    
    if (cachedResponse && cachedResponse.data) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)cachedResponse.response;
        // 响应HTTP报头，服务端给客户端
        NSString *lastModifiedValue = httpResponse.allHeaderFields[@"Last-Modified"];
        if (lastModifiedValue) {
            // 客户端给服务端的http报文头部，最后修改时间是否过期，未过期 304
            [mutableRequest setValue:lastModifiedValue forHTTPHeaderField:@"If-Modified-Since"];
        }
        isCacheData = YES;
    }
    
    
    NSURLSessionTask *task = [self.defaultSession dataTaskWithRequest:mutableRequest];
    NSString *taskKey = [self getTaskKeyForTask:task];
    
    HttpTaskContext *taskContext = [[HttpTaskContext alloc] init];
    taskContext.createTime = [[NSDate date] timeIntervalSince1970];
    taskContext.task = task;
    taskContext.session = self.defaultSession;
    taskContext.excuteCount = 0;
    taskContext.success = success;
    taskContext.failure = failure;
    
    [self.lock lock];
    self.taskContext[taskKey] = taskContext;
    [self.mutableTasks addObject:task];
    
    if (isCacheData) {
        self.cachedDatas[taskKey] = cachedResponse.data;
    }
    [self.lock unlock];
    
    
    [self excuteReuqestIfNeeded];
    
    return taskKey;
}

- (NSString *)getTaskKeyForTask: (NSURLSessionTask*)task {
    return [NSString stringWithFormat:@"%lu", task.taskIdentifier];
}

- (void)excuteReuqestIfNeeded {
    if (self.runningTaskCount >= MAX_TASK_COUNT || self.mutableTasks.count == 0) {
        return;
    }
    NSURLSessionTask *willRunTask;
    [self.lock lock];
    willRunTask = [self.mutableTasks objectAtIndex:0];
    [self.mutableTasks removeObjectAtIndex:0];
    [self.lock unlock];

    [willRunTask resume];
    self.runningTaskCount += 1;
}

#pragma mark - Cache

- (NSURLCache *)defaultURLCache {
    return [[NSURLCache alloc] initWithMemoryCapacity:20 * 1024 * 1024
                                         diskCapacity:150 * 1024 * 1024
                                             diskPath:@"HttpConnectionDisKCache"];
}



#pragma mark -
#pragma mark - NSURLSessionDelegate

/// 当前session 失效时调用
/// @param session session
/// @param error error
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(NSError *)error {
    NSLog(@"当前 session =%@ 失效", session.sessionDescription);
}

/// https 认证
/// @param session session
/// @param challenge 认证挑战
/// @param completionHandler 回调
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler {
    /*
         NSURLSessionAuthChallengePerformDefaultHandling：默认方式处理
         NSURLSessionAuthChallengeUseCredential：使用指定的证书
         NSURLSessionAuthChallengeCancelAuthenticationChallenge：取消挑战
     */

    
    
    /**
     HTTPS 链接建立过程
     1. client向server发送一段请求报文信息，报文包含TLS版本、客户端支持的加密算法、随机数C
     2. server端向client端返回握手报文消息，包括商定的加密算法、随机数S,server证书；
     3. client端收后对证书的公钥进行验证，判断其合法性，根据随机数C、S和预主密钥组装会话密钥
     4. client发送报文到server端，通过server的公钥对预主密钥加密传输
     5. server端通过私钥解密得到预主密钥，server通过随机数C、S和得到的预主密钥组装会话密钥
     6. client端发送加密的握手消息
     7. server端发送加密的握手消息
     8. 验证安全通道是否完成
     */
    
    
    // 挑战处理类型使用默认
    NSURLSessionAuthChallengeDisposition disposition = NSURLSessionAuthChallengePerformDefaultHandling;
    
    // 此处服务器端需要客户端返回一个根据认证挑战的保护空间提供的信任产生的挑战证书。
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]) {
        
        // 使用证书校验方法对服务端的servierTrust 校验
        SecTrustResultType result;
        OSStatus status = SecTrustEvaluate(challenge.protectionSpace.serverTrust, &result);
        if (status != 0) {
            disposition = NSURLSessionAuthChallengeCancelAuthenticationChallenge;
        }
        
        if (result != kSecTrustResultUnspecified) {
            NSInteger certCount = SecTrustGetCertificateCount(challenge.protectionSpace.serverTrust);
            NSMutableString *error = [NSMutableString string];
            for (NSInteger i = 0; i < certCount; i++) {
                SecCertificateRef certificateRef = SecTrustGetCertificateAtIndex(challenge.protectionSpace.serverTrust, i);
                NSString *desc = (__bridge_transfer NSString*) CFCopyDescription(certificateRef);
                [error appendFormat:@"didReceiveChallenge %ld issuer : %@", (long)i, desc];
                NSLog(@"证书验证失败%@", error);
            }
            
            disposition = NSURLSessionAuthChallengeCancelAuthenticationChallenge;
        }
    }
    
    if (completionHandler) {
        completionHandler(disposition, nil);
    }
}


#pragma mark -
#pragma mark - NSURLSessionTaskDelegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    if (PrintLog) {
        NSLog(@"%@ didReceiveData length: %ld", dataTask.originalRequest.URL, data.length);
    }
    NSString *taskKey = [self getTaskKeyForTask:dataTask];
    NSMutableData *responseData = self.taskDatas[taskKey];
    if (!responseData) {
        responseData = [NSMutableData dataWithData:data];
        self.taskDatas[taskKey] = responseData;
    } else {
        [self.taskDatas[taskKey] appendData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (PrintLog) {
        NSLog(@"%@ Request Failed: %@", task.originalRequest.URL, error);
    }
    NSString *taskKey = [self getTaskKeyForTask:task];
    NSMutableData *responseData = self.taskDatas[taskKey];
    HttpTaskContext *context = self.taskContext[taskKey];
    
    NSDictionary *response;
    if (responseData) {
        response = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
        response = [HttpRequestBuilder JSONObjectByRemovingKeysWithNullValues:response];
    }
    
    
    // 304
    NSData *cacheData = self.cachedDatas[taskKey];
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
    if (httpResponse.statusCode == 304 && self.cachedDatas) {
        response = [NSJSONSerialization JSONObjectWithData:cacheData options:0 error:nil];;
    }
    
    NSString *lastModifiedValue = httpResponse.allHeaderFields[@"Last-Modified"];
    if (lastModifiedValue && responseData && httpResponse.statusCode == 200) {
        NSCachedURLResponse *cachedResponse = [[NSCachedURLResponse alloc] initWithResponse:task.response data:responseData];
        [[NSURLCache sharedURLCache] storeCachedResponse:cachedResponse forRequest:task.originalRequest];
    }
    
    // error
    NSError *httpError = error;
    if (httpResponse.statusCode >= 400) {
        httpError = [NSError errorWithDomain:@"NetworkError" code:httpResponse.statusCode userInfo:nil];
    }
    
    [self.lock lock];
    [self.taskDatas removeObjectForKey:taskKey];
    [self.taskContext removeObjectForKey:taskKey];
    [self.cachedDatas removeObjectForKey:taskKey];
    [self.lock unlock];
    
    self.runningTaskCount -= 1;
    [self excuteReuqestIfNeeded];
    
    if (httpError) {
        context.failure(httpError, response);
    } else {
        context.success(responseData);
    }
}

@end

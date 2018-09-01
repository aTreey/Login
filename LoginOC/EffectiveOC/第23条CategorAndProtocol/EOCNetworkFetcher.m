//
//  EOCNetworkFetcher.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCNetworkFetcher.h"


@interface EOCNetworkFetcher() {
    
    /// eg：C语言结构体
    /// 设置结构体某个字段占用二进制位为特定的个数
    /// 1位二进制数，就只有和两种状态。2位就有00，01，10，11四种状态。n位就有2的n次方个不同的值。
    struct data {
        unsigned int fieldA: 8; // 占8个 2^8 表示 0～225之间的值
        unsigned int fieldB: 4; // 占4个 2^4 表示 0～16之间的值
        unsigned int fieldC: 2; // 占2个 2^2 表示 0～4之间的值
        unsigned int fieldD: 1; // 占1个 2^1 表示 0～1之间的值
        
    };
    
    
    /// 此结构体为了缓存委托对象响应委托者的方法
    /// 占 1 位，只能表示0 和1 两个值，把许多的 Boolean 类型的值存入到一个小块数据中
    struct {
        unsigned int didReceiveData: 1;
        unsigned int didFailWithError: 1;
        unsigned int didUpdateProgressTo: 1;
    } _delegateFlags;
}

@end

@implementation EOCNetworkFetcher

/// 发送网络请求
- (void)request {
    NSData *data = [@"networkData" dataUsingEncoding:NSUTF8StringEncoding];
    /// 判断委托对象是否实现了相关方法
//    if ([_delegate respondsToSelector:@selector(networkFetcher:didReceiveData:)]) {
//        [_delegate networkFetcher:self didReceiveData:data];
//    }
    
    
    /// 实现了 - (void)setDelegate:(id<EOCNetworkFetcherDelegate>)delegate 之后的写法
    if (_delegateFlags.didReceiveData) {
        [_delegate networkFetcher:self didReceiveData:data];
    }
    
    if (_delegateFlags.didUpdateProgressTo) {
        [_delegate networkFetcher:self didUpateProgressTo:0.8];
    }
    
    if (_delegateFlags.didFailWithError) {
        NSError *error = [[NSError alloc] init];
        [_delegate networkFetcher:self didFailWithError:error];
    }
}


#pragma mark - setter

/// 实现次方法后，每次调用委托对象的相关方法之前，只需要查询结构体里的标志。不用在此检测委托对象是否能响应给定的方法了
- (void)setDelegate:(id<EOCNetworkFetcherDelegate>)delegate {
    _delegate = delegate;
    _delegateFlags.didReceiveData = [delegate respondsToSelector:@selector(networkFetcher:didReceiveData:)];
    _delegateFlags.didFailWithError = [delegate respondsToSelector:@selector(connection:didFailWithError:)];
    _delegateFlags.didUpdateProgressTo = [delegate respondsToSelector:@selector(networkFetcher:didUpateProgressTo:)];
}

@end

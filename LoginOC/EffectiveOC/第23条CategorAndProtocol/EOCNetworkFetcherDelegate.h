//
//  EOCNetworkFetcherDelegate.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//  网络请求的委托协议

//  第23条 通过委托与数据源协议进行对象间通信

/// eg: 从网络上获取数据
/// 1. 访问网络可能需要很长的时间，在此期间阻塞程序是个糟糕的体验，通过委托模式获取完成后哦回调这个委托对象

#import <Foundation/Foundation.h>

@class EOCNetworkFetcher;

NS_ASSUME_NONNULL_BEGIN

@protocol EOCNetworkFetcherDelegate <NSObject>

/// 1. 委托协议中方法一般都是 @optional 可选的, 委托对象调用时需要检查是否相应了相关方法
@optional
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didReceiveData:(NSData *)data;
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didFailWithError:(NSError *)error;


/// 更新进度方法
- (void)networkFetcher:(EOCNetworkFetcher *)fetcher didUpateProgressTo:(float)progress;

@end

NS_ASSUME_NONNULL_END

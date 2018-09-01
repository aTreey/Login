//
//  EOCNetworkFetcher.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//  网络请求类

#import <Foundation/Foundation.h>
#import "EOCNetworkFetcherDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface EOCNetworkFetcher : NSObject
/// 2. 用属性存放其委托对象，使用weak修饰，防止循环引用
@property (nonatomic, weak) id <EOCNetworkFetcherDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

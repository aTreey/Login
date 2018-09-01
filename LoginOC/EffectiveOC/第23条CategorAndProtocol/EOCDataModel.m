//
//  EOCDataModel.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//  EOCNetworkFetcher 的委托对象


#import "EOCDataModel.h"
#import "EOCNetworkFetcherDelegate.h"


/// 4. 因为这个协议是委托协议，通常只会在类的内部使用，
@interface EOCDataModel () <EOCNetworkFetcherDelegate>

@end

@implementation EOCDataModel

- (void)networkFetcher:(nonnull EOCNetworkFetcher *)fetcher didFailWithError:(nonnull NSError *)error {
    /* Handling data */
    NSLog(@"didFailWithError - %@,", error);
    
    /// 5. 如果委托对象有多个不同"网络数据抓取器"，需要根据传入的参数判断具体的类型作出相应的逻辑处理
//    if (fetcher == _fethcerA) {
//        /* Handling data_A */
//    } else if (fetcher == _fetcherB) {
//        /* Handling data_B */
//    }
}

- (void)networkFetcher:(nonnull EOCNetworkFetcher *)fetcher didReceiveData:(nonnull NSData *)data {
    /* Handling data */
    NSLog(@"didReceiveData - %@,", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
}

@end

// =========数据源模式========
// 以上都是 “委托模式”，有时候可以定义一套协议，让某个经过该接口获取其所需的数据，例如TableView 的数据源 dataSource 这一用法旨在向类提供数据，称“数据源模式”



////////////////////// 结论 /////////////
//  结论：
// - 委托模式为对象提供了一套接口，使其可以由此将相关事件告知其他对象
// - 将委托对象应该支持的接口定义成协议，在协议中把可能需要处理的事件定义成方法
// - 当某个对象需要从m另一个对象获取数据时，可以使用委托模式，这种情况下，该模式为“数据源模式”
// - 若有必要，可实现含有二进制位段的结构体，将委托对象是否能响应相关协议方法这一信息缓存在其中


// 1. 常规“委托模式”中 信息流向是从 EOCNetworkFetcher 类流向受委托者 delegate
// 2. “数据源模式” 信息流向是从 数据源 流向类
// 3. 一般情况下"数据源"和"受委托者"都是同一个对象来扮演两种角色，两者也可以是不同的对象，逻辑代码分开会更加清晰




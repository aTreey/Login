//
//  WebViewPool.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/12/3.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import "WebViewPool.h"
#import <WebKit/WebKit.h>

@interface WebViewPool ()

@property (nonatomic, strong) NSMutableSet *visiableWebViewSet;
@property (nonatomic, strong) NSMutableSet *reusableWebViewSet;

@end

@implementation WebViewPool

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WebViewPool *instance = nil;
    dispatch_once(&onceToken, ^{
        instance = [[super allocWithZone:NULL] init];
    });
    return instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedInstance];
}


- (instancetype)init {
    self = [super init];
    if (self) {
        self.visiableWebViewSet = nil;
        self.reusableWebViewSet = nil;
    }
    return self;
}


- (void)prepareReuseWebView {
    [self setupWebView];
}



- (WKWebView *)setupWebView {
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.preferences = [[WKPreferences alloc] init];
    configuration.allowsInlineMediaPlayback = YES;
    configuration.selectionGranularity = WKSelectionGranularityCharacter;
    
    // JS和OC交互
    WKUserContentController *userContenController = [WKUserContentController new];
    WKUserScript *cookieScript = [[WKUserScript alloc] initWithSource:@"" injectionTime:WKUserScriptInjectionTimeAtDocumentStart forMainFrameOnly:NO];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    webView.allowsBackForwardNavigationGestures = YES;
    return webView;
}


#pragma mark - lazy

- (NSMutableSet *)visiableWebViewSet {
    if (!_visiableWebViewSet) {
        _visiableWebViewSet = [[NSMutableSet alloc] init];
    }
    return _visiableWebViewSet;
}

- (NSMutableSet *)reusableWebViewSet {
    if (!_reusableWebViewSet) {
        _reusableWebViewSet = [[NSMutableSet alloc] init];
    }
    return _reusableWebViewSet;
}


@end

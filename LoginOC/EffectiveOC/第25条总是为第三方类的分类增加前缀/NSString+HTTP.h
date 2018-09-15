//
//  NSString+HTTP.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (HTTP)

- (void)urlEncodedString;

- (void)urlDecodedString;

@end

NS_ASSUME_NONNULL_END

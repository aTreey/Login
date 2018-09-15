//
//  EOCDatabaseConnection.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol EOCDatabaseConnection <NSObject>
- (void)connect;
- (void)disconnect;
- (void)isConnected;
- (NSArray *)performQuery:(NSString *)query;
@end

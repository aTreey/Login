//
//  SOAPController.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/27.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, TestState) {
    TestStateNone,
    TestStateOne,
    TestStateTwo,
};

@interface SOAPController : UIViewController

@property (assign) TestState state;
@property (strong) NSDictionary *dict;
@end

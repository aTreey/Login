//
//  SCRecorderPlayerController.h
//  LoginOC
//
//  Created by HongpengYu on 2019/2/20.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <SCRecorder/SCRecorder.h>


NS_ASSUME_NONNULL_BEGIN

@interface SCRecorderPlayerController : UIViewController
@property (strong, nonatomic) SCRecordSession *recordSession;
@end

NS_ASSUME_NONNULL_END

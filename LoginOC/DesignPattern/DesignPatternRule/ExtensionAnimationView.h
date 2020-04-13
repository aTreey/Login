//
//  ExtensionAnimationView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FadeAnimationView.h"

NS_ASSUME_NONNULL_BEGIN

/**
 原来类提供的方法不足以满足使用时，避免采用继承 BaseAnimationView 的方式来扩展方法，
 -******而 是通过一个容器类以聚合的方式来实现 ****************
 */

@interface ExtensionAnimationView : UIView

@property (nonatomic, strong) FadeAnimationView *fadeAnimationView;

// 通过聚合方式扩展的方法
- (void)changeToErrorStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END

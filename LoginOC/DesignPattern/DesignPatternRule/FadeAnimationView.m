//
//  FadeAnimationView.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "FadeAnimationView.h"

@implementation FadeAnimationView

/**
 抽象不依赖于细节，细节必须依赖于抽象
 */

// 抽象方法依赖于具体的实现方法 - (void)fadeAnimated:(BOOL)animated，具体的实现方法不应该暴露出来
- (void)changeToHighlightStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration {
    // TODO
}


/**
 作为私有的方法不应该暴露在 .h 文件中，会破坏封装，违背里氏替换原则，
 */
#pragma mark - privaet

- (void)fadeAnimated:(BOOL)animated {
    // todo
}

@end

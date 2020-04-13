//
//  FadeAnimationView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/13.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "BaseAnimationView.h"

NS_ASSUME_NONNULL_BEGIN

/// 扩展 BaseAnimationView
@interface FadeAnimationView : BaseAnimationView

@property (nonatomic, strong) NSMutableAttributedString *attributeTitle;

- (void)changeToHighlightStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;

@end

NS_ASSUME_NONNULL_END

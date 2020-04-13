//
//  BaseAnimationView.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/12.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseAnimationView : UIView

@property (nonatomic, strong) NSString *title;

/*
 接口隔离原则：
 如果执行动画时，duration有用，否则无用，而UIView执行动画本身是需要时间的
 
 如果如以下方法增加frame参数就是不合理， 因为执行动画并不需要frame值，frame 参数做了不该做的事情，具体的frame可以在实现中实现而不需要暴露出来
 - (void)changeToNomalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration frame:(CGReact)frame;

 
 */

/// view切换到正常状态时是否需要执行动画
/// @param animated 是否有动画
/// @param duration 时间
- (void)changeToNomalStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;



/// 切换到禁止状态
/// @param animated 是否有动画
/// @param duration 时间
- (void)changeToDisableStateAnimated:(BOOL)animated duration:(NSTimeInterval)duration;


@end

NS_ASSUME_NONNULL_END

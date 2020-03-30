//
//  CommandSlider.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/11.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Command.h"

NS_ASSUME_NONNULL_BEGIN

/// 被适配者CommandSlider
/*
 滑块每个细小的移动，会用新的值触发对接收器的更新，这种场景想到使用命令模式中定义的调用器，调用器保持对象的引用，并且在被调用时执行它，所以滑动条也需要保持命令对象的引用，以便于对其进行处理，需要自定义 UISlider 的子类来实现跟命令对象一起使用
 */

// 滑动条监听value change 事件，当滑动条变动时，运行库会使用应该被调用“目标-动作”触发这一事件，滑动条然后会执行保存的命令对象，

@interface CommandSlider : UISlider

@property (nonatomic, strong) Command *command;

@end

NS_ASSUME_NONNULL_END

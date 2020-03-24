//
//  SetStrokeColorCommand.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/10.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "Command.h"

@class SetStrokeColorCommand;

NS_ASSUME_NONNULL_BEGIN

/// SetStrokeColorCommand 的目标接口、告诉适配器提供什么
@protocol SetStrokeColorCommandDelegate <NSObject>


/// 通过传递红绿蓝色值返回独立的RGB值
/// @param command 命令对象
/// @param red 红
/// @param green 绿
/// @param blue 蓝
- (void) command:(SetStrokeColorCommand *) command
                didRequestColorComponentsForRed:(CGFloat) red
                                          green:(CGFloat) green
                                           blue:(CGFloat) blue;


/// 颜色更新过程结束时调用，命令对象把自己和更新后的颜色传给适配器，这样它就可以利用这个时机用新颜色作任何其他处理
/// @param command 命令对象
/// @param color 颜色
- (void) command:(SetStrokeColorCommand *) command
                didFinishColorUpdateWithColor:(UIColor *) color;

@end


/// 客户端 SetStrokeColorCommand，它用delegate 保持SetStrokeColorCommand-Delegate 的引用
@interface SetStrokeColorCommand : Command

@property (nonatomic, weak) id<SetStrokeColorCommandDelegate> delegate;

/// 命令对象中委托应该是个接收器，接收来自命令对象的任何动作消息，
/// 事实上此处命令的接收器不在此处定义为属性，而应在execute方法获得
- (void)execute;

@end

NS_ASSUME_NONNULL_END

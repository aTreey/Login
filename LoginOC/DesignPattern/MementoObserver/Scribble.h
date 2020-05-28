//
//  Scribble.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/22.
//  Copyright © 2020 于鸿鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

/**
 1、每次把不同的Scribble实例赋给CanvasViewController时，CanvasViewController会使用addObserver:方法把自己作为观察者添加到Scribble的实例，
 2、如果Scribble的实例内部发生变化（在Mark组合对象中添加或删除组件），需要通过对 willChangeValueForkey:和didChangeValueForKey:的一对调用，手动触发全局更新
 3、NSObject 中的KVO实现会传递 oberverValueForKey:path:context:消息给观察者CanvasViewController，在回调方法中，会用从消息得到的新Mark实例，更新其 canvasView并令其重画
 */

NS_ASSUME_NONNULL_BEGIN

@interface Scribble : NSObject

/// 父类
/// 只供ScribScribble对象来访问的mark属性
@property (nonatomic, strong) id<Mark> parentMark;


// 管理 Mark 的方法，发给实例的addMark: 和 removeMark: 消息会触发对其观察者的更新广播

/// 客户端可以向Scribble 发送 addMark:shouldAddToPreviousMark: 消息，把任何Mark实例插入到其内部组合，
/// @param aMark
/// @param shouldAddToPreviousMark 是否把输入的Mark对象作为一个部分附加到原有的聚合体中
- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark;
- (void) removeMark:(id <Mark>)aMark;


@end

NS_ASSUME_NONNULL_END

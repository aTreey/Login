//
//  PaletteViewController.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/11.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandSlider.h"
#import "SetStrokeColorCommand.h"

NS_ASSUME_NONNULL_BEGIN

/// 在此控制器中使用适配器，因为控制器拥有并控制着滑动条

/**
 为了给客户端 SetStrokeColorCommand 做任何适配，需要遵守 SetStrokeColorCommandDelegate 协议
 */

@interface PaletteViewController : UIViewController <SetStrokeColorCommandDelegate>


/// 滑块事件处理
/// @param sender 颜色滑块
- (IBAction)onCommandSliderValueChanged:(CommandSlider *)sender;

@end

NS_ASSUME_NONNULL_END

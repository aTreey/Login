//
//  ScribbleManager.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/4/15.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Scribble.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleManager : NSObject

- (void)saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END

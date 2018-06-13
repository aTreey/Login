//
//  UIViewController+LayoutGuide.h
//  LoginOC
//
//  Created by liepin on 2018/4/17.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@interface UIViewController (LayoutGuide)
- (void)loginModule;
- (void)dropMenuView;
- (void)test;
- (void)spaceTest;
- (void)containerCenter;
- (void)testAutoresizingMask;
- (void)suspendPlayVido;

@end

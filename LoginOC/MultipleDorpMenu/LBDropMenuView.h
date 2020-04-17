//
//  LBDropMenuView.h
//  LoginOC
//
//  Created by yhp on 2018/4/8.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

;

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

@class LBDropMenuView;
@class CourseJsonTreeDataResponse;

@protocol LBDropMenuViewDelegate <NSObject>
- (void)dropMenuView:(LBDropMenuView *)view didSelectItem:(CourseJsonTreeDataResponse *)data;
- (void)dropMenuView:(LBDropMenuView *)view confirmButton:(UIButton *)sender;
@end

@interface LBDropMenuView : UIView
@property (nonatomic, weak) id<LBDropMenuViewDelegate> delegate;
@property (nonatomic, strong) UIView *arrowView;

-(void)creatDropView:(UIView *)view withShowTableNum:(NSInteger)tableNum withData:(NSArray *)arr;
- (void)dismiss;
@end

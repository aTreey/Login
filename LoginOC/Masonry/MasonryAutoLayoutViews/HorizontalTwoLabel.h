//
//  HorizontalTwoLabel.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/11/27.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HorizontalTwoLabel : UIView

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@end

NS_ASSUME_NONNULL_END

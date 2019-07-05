//
//  CHJBaseMessageCell.h
//  LoginOC
//
//  Created by YuHongpeng on 2019/6/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CHJMessageContentView.h"


NS_ASSUME_NONNULL_BEGIN

@interface CHJBaseMessageCell : UITableViewCell

@property (nonatomic) EMMessageDirection direction;
//
//@property (nonatomic, strong) EMMessageModel *model;

@property (nonatomic, strong) UIImageView *messageReadStateImageView;

/**
 *  显示用户头像
 */
@property (nonatomic, strong) UIImageView *avatarImageView;

/**
 *  显示用户昵称的UILabel
 */
@property (nonatomic, strong) UILabel *nickNameLabel;

/**
 *  显示用户消息主体的View,所有的消息用到的textView,imageView都会被添加到这个view中 -> LCCKContentView 自带一个CAShapeLayer的蒙版
 */
@property (nonatomic, strong) CHJMessageContentView *messageContentView;

/**
 *  显示消息发送状态的UIImageView -> 用于消息发送不成功时显示
 */
@property (nonatomic, strong) UIButton *messageSendStateView;

/**
 *  messageContentView的背景层
 */
@property (nonatomic, strong) UIImageView *messageContentBackgroundImageView;

/** 左侧文本消息文字颜色 */
@property (nonatomic, strong) UIColor *conversationViewMessageLeftTextColor;

/** 右侧文本消息文字颜色 */
@property (nonatomic, strong) UIColor *conversationViewMessageRightTextColor;

- (void)configureCellWithData:(id)message;

@end

NS_ASSUME_NONNULL_END

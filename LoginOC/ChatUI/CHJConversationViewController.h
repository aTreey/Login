//
//  CHJConversationViewController.h
//  LoginOC
//
//  Created by YuHongpeng on 2019/6/5.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CHJBaseChatViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CHJConversationViewController : CHJBaseChatViewController

/// 会话 id
@property (nonatomic, copy, readonly) NSString *conversationId;

- (instancetype)initWithConversationId:(NSString *)conversationId;
//

//- (instancetype)initWithConversationId:(NSString *)aId
//                                  type:(EMConversationType)aType
//                      createIfNotExist:(BOOL)aIsCreate



#pragma mark - send Message
///=============================================================================
/// @name send Message
///=============================================================================

/*!
 *  文本发送
 * @attention 发送前必须检查 `isAvailable` 属性是否为YES
 */
- (void)sendTextMessage:(NSString *)text;

/*
 * 图片发送 包含图片上传交互
 * 默认图片压缩比0.6，如想自定义压缩比，请使用 `-sendImageMessageData` 方法
 *
 * @param image, 要发送的图片
 * @attention Remember to check if `isAvailable` is ture, making sure sending message after conversation has been fetched
 *            发送前必须检查 `isAvailable` 属性是否为YES, 确保发送行为是在 conversation 被 fetch 之后进行的。
 */
- (void)sendImageMessage:(UIImage *)image;

- (void)sendImageMessageData:(NSData *)imageData;

/*!
 * 语音发送
 * @attention Remember to check if `isAvailable` is ture, making sure sending message after conversation has been fetched
 *            发送前必须检查 `isAvailable` 属性是否为YES, 确保发送行为是在 conversation 被 fetch 之后进行的。
 */
- (void)sendVoiceMessageWithPath:(NSString *)voicePath time:(NSTimeInterval)recordingSeconds;

/*!
 * 地理位置发送
 * @attention Remember to check if `isAvailable` is ture, making sure sending message after conversation has been fetched
 *            发送前必须检查 `isAvailable` 属性是否为YES, 确保发送行为是在 conversation 被 fetch 之后进行的。
 */
//- (void)sendLocationMessageWithLocationCoordinate:(CLLocationCoordinate2D)locationCoordinate locatioTitle:(NSString *)locationTitle;

/*!
 * 本地消息，仅仅在本地展示，不会发送到服务端
 */
- (void)sendLocalFeedbackTextMessge:(NSString *)localFeedbackTextMessge;

/*!
 * 自定义消息位置发送
 * @attention Remember to check if `isAvailable` is ture, making sure sending message after conversation has been fetched
 *            发送前必须检查 `isAvailable` 属性是否为YES, 确保发送行为是在 conversation 被 fetch 之后进行的。
 */
//- (void)sendCustomMessage:(AVIMTypedMessage *)customMessage;

/*!
 * 自定义消息位置发送
 * @attention 自定义消息暂时支持失败消息本地缓存
 * @attention Remember to check if `isAvailable` is ture, making sure sending message after conversation has been fetched
 *            发送前必须检查 `isAvailable` 属性是否为YES, 确保发送行为是在 conversation 被 fetch 之后进行的。
 */
//- (void)sendCustomMessage:(AVIMTypedMessage *)customMessage
//            progressBlock:(AVProgressBlock)progressBlock
//                  success:(LCCKBooleanResultBlock)success
//                   failed:(LCCKBooleanResultBlock)failed;

//TODO:
/*!
 * 发送用户的当前输入状态
 */
//- (void)sendInputStatus:(LCCKConversationInputStatus)status;

/*!
 *  是否禁用文字的双击放大功能，默认为 NO
 */
@property (nonatomic, assign) BOOL disableTextShowInFullScreen;

/*!
 * 是否禁用标题自动配置
 * 默认配置如下：
 *          - 最右侧显示静音状态
 *          - 单聊默认显示对方昵称，群聊显示 `conversation` 的 name 字段值
 */
@property (nonatomic, assign, getter=isDisableTitleAutoConfig) BOOL disableTitleAutoConfig;


@end

NS_ASSUME_NONNULL_END

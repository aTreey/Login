//
//  EOCPerson.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson : NSObject
@property (nonatomic, copy, readonly) NSString *firstName;
@property (nonatomic, copy, readonly) NSString *lastName;
@property (nonatomic, strong, readonly) NSArray *friends;

- (instancetype)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;


///* friendship methods */
//- (void)addFriend:(EOCPerson *)person;
//- (void)removeFriend:(EOCPerson *)person;
//- (BOOL)isFriendsWith:(EOCPerson *)person;
//
///* work methods */
//- (void)performDaysWork;
//- (void)takeVacationFromWork;
//
///* play methods */
//- (void)goToTheCinema;
//- (void)goToSportsGame;


@end

NS_ASSUME_NONNULL_END

/// 实现改类时，所有方法的代码可能会导致文件过大，变得难管理，使用分类分成几个不同的部分实现对应方法

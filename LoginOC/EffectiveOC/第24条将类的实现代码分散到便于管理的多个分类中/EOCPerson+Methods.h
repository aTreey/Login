//
//  EOCPerson+Methods.h
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCPerson.h"

NS_ASSUME_NONNULL_BEGIN

@interface EOCPerson (Methods)

@end


@interface EOCPerson (Friendship)
- (void)addFriend:(EOCPerson *)person;
- (void)removeFriend:(EOCPerson *)person;
- (BOOL)isFriendsWith:(EOCPerson *)person;

@end

@interface EOCPerson (Work)
- (void)performDaysWork;
- (void)takeVacationFromWork;
@end


@interface EOCPerson (Play)
- (void)goToTheCinema;
- (void)goToSportsGame;
@end

NS_ASSUME_NONNULL_END

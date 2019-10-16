//
//  CalendarManager.h
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/7/9.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>

typedef void (^eventsOperationCompletionHandler)(BOOL success, NSError *error, NSString *eventIdentifier);

NS_ASSUME_NONNULL_BEGIN

@interface CalendarManager : NSObject

@end

NS_ASSUME_NONNULL_END

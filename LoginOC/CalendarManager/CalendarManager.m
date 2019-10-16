
//
//  CalendarManager.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2019/7/9.
//  Copyright © 2019 HongpengYu. All rights reserved.
//

#import "CalendarManager.h"

@interface CalendarManager ()

@property(nonatomic, strong) EKEventStore *eventStore;
@property(nonatomic, strong) EKCalendar *calendar;

@end

@implementation CalendarManager

+(instancetype)sharedManager
{
    static CalendarManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        manager = [[self alloc]init];
    });
    return manager;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.eventStore = [[EKEventStore alloc]init];
        if ([CalendarManager calendarAccessGranted]) {
            self.calendar = [self.eventStore defaultCalendarForNewEvents];
        }
    }
    return self;
}


#pragma mark - Event operations
-(void)createEvent:(NSString *)eventTitle location:(NSString *)location startTime:(NSDate *)startDate endTime:(NSDate *)endDate description:(NSString *)description URL:(NSString *)urlString completionHanlder:(eventsOperationCompletionHandler)handler
{
    NSError *error = nil;
    if (!self.calendar) {
        error = [[NSError alloc] init];
        handler(NO,error,nil);
        return;
    }
    
    EKEvent *event = [EKEvent eventWithEventStore:self.eventStore];
    
    event.calendar = self.calendar;
    
    event.title = eventTitle;
    event.location = location;
    event.startDate = startDate;
    event.endDate = endDate;
    event.notes = description;
    event.URL = [NSURL URLWithString:urlString];
    
    BOOL success = [self.eventStore saveEvent:event span:EKSpanThisEvent commit:YES error:&error];
    handler(success,error,event.eventIdentifier);
}

#pragma mark - Determine access to calendar
+(BOOL)calendarAccessGranted {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    return (status == EKAuthorizationStatusAuthorized)?YES:NO;
}

+(BOOL)shouldRequestCalendarAccess {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    return (status == EKAuthorizationStatusNotDetermined)?YES:NO;
}

+(BOOL)shouldGrantAccessManually {
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (status == EKAuthorizationStatusDenied || status == EKAuthorizationStatusRestricted) {
        return YES;
    }
    else return NO;
}

-(void)requestCalendarAccessWithCompletionHandler:(EKEventStoreRequestAccessCompletionHandler)handler {
    if ([CalendarManager shouldRequestCalendarAccess]) {
        [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:handler];
    }
    if ([CalendarManager calendarAccessGranted]){
        handler(YES,nil);
    }
    if ([CalendarManager shouldGrantAccessManually]) {
        NSError *error = [NSError new];
        handler(NO,error);
    }
}

@end

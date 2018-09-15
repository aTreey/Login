//
//  NSCalendar+EOC_Additions.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/1.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "NSCalendar+EOC_Additions.h"



@implementation NSCalendar (EOC_Additions)

- (NSArray *)eoc_allMonths {
    if ([self.calendarIdentifier isEqualToString:NSCalendarIdentifierGregorian]) {
        return @[
                 @"Jan", @"Feb",
                 @"Mar", @"Apr",
                 @"May", @"Jun",
                 @"Jul", @"Aug",
                 @"Sep", @"Oct",
                 @"Nov", @"Dec",
                 ];
    } else {
        // 其他日历
        return @[];
    }
}

@end

/// 由于获取方法并不需要访问数据，而且属性也不需要实例变量来实现，可以像上面实现

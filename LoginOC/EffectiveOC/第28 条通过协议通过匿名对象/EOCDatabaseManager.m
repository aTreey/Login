//
//  EOCDatabaseManager.m
//  LoginOC
//
//  Created by HongpengYu on 2018/9/15.
//  Copyright © 2018 HongpengYu. All rights reserved.
//

#import "EOCDatabaseManager.h"
#import "EOCDatabaseConnection.h"
#import <CoreData/CoreData.h>

/// 匿名分类遵守协议
@interface EOCDatabaseManager ()<EOCDatabaseConnection>
@end

@implementation EOCDatabaseManager
static EOCDatabaseManager *shareInstance = nil;
+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (id<EOCDatabaseConnection>)connectionWithIdentifier:(NSString *)identifier {
    return [EOCDatabaseManager sharedInstance];
}

#pragma mark - EOCDatabaseConnection methond
- (void)connect {
    
}

- (void)disconnect {
    
}

- (void)isConnected {
    
}

- (NSArray *)performQuery:(NSString *)query {
    return @[];
}


#pragma mark - CoreData 中
- (void)testCoreData {
    
    /**
     @interface NSFetchedResultsController<ResultType:id<NSFetchRequestResult>> : NSObject
     
     @property (nullable, nonatomic, readonly) NSArray<id<NSFetchedResultsSectionInfo>> *sections;

     @end
     */
    NSFetchedResultsController *controller = [NSFetchedResultsController new];
    NSUInteger section = 1;
    NSArray *sections = controller.sections;
    
    // sectionInfo 匿名对象，这样就把数据分区如何保存的细节隐藏了起来
    id<NSFetchedResultsSectionInfo> sectionInfo = sections[section];
    
    NSInteger numberOfobjects = sectionInfo.numberOfObjects;
}

@end

////////////////////// 结论 /////////////
/// 1. 使用协议某种程度上可以提供匿名类型，具体的类型可以通过遵守某些协议淡化，协议中规定了遵守协议的对象所要实现的方法
/// 2. 使用匿名对象来隐藏类型名称或者类名
/// 3. 如果具体类型不重要，重要的是对象具体特定的功能，可以使用匿名对象来表示

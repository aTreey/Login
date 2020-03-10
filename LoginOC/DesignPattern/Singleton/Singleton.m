//
//  Singleton.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/9.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *sharedSingleton_ = nil;

- (void) operation
{
  NSLog(@"Singleton");
}

+ (Singleton *) sharedInstance
{
  if (sharedSingleton_ == nil)
  {
      // alloc 方法本质上是用设置为 NULL 的方法来调用 allocWithZone: 方法，此时如果使用 [[super alloc] init] 方法会和已经重载的对象分配 allocWithZone:方法发生死循环
//      sharedSingleton_ = [[super alloc] init];
      
      // 所以 使用以下方法调用
      sharedSingleton_ = [[super allocWithZone:NULL] init];
      
      // 自动引用计数下不可用
//      sharedSingleton_ = [NSAllocateObject([self class], 0, NULL) init];
  }
  
  return sharedSingleton_;
}


+ (id) allocWithZone:(NSZone *)zone
{
  return [self sharedInstance];
}


- (id) copyWithZone:(NSZone*)zone
{
  return self;
}

//- (id) retain
//{
//  return self;
//}
//
//- (NSUInteger) retainCount
//{
//  return NSUIntegerMax; // denotes an object that cannot be released
//}
//
//- (void) release
//{
//  // do nothing
//}
//
//- (id) autorelease
//{
//  return self;
//}


@end

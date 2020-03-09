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
    sharedSingleton_ = [[super alloc] init];
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

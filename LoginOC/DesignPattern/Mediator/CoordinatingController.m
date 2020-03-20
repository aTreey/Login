//
//  CoordinatingController.m
//  LoginOC
//
//  Created by 于鸿鹏 on 2020/3/10.
//  Copyright © 2020 HongpengYu. All rights reserved.
//

#import "CoordinatingController.h"

@interface CoordinatingController ()

@property (nonatomic, readwrite) CanvasViewController *canvasViewController;

@end

@implementation CoordinatingController

static CoordinatingController *sharedCoordinator = nil;

- (void) initialize
{
  self.canvasViewController = [[CanvasViewController alloc] init];
}

+ (CoordinatingController *) sharedInstance
{
  if (sharedCoordinator == nil)
  {
    sharedCoordinator = [[super allocWithZone:NULL] init];
    
    // initialize the first view controller
    // and keep it with the singleton
    [sharedCoordinator initialize];
  }
  
  return sharedCoordinator;
}

@end

//
//  MasonryTestController.m
//  LoginOC
//
//  Created by HongpengYu on 2018/6/13.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import "MasonryTestController.h"

@interface MasonryTestController ()
@property (nonatomic, strong) Class viewClass;
@end

@implementation MasonryTestController

- (id)initWithTitle:(NSString *)title viewClass:(Class)viewClass {
    self = [super init];
    if (!self) return nil;
    
    self.title = title;
    self.viewClass = viewClass;
    
    return self;
}

- (void)loadView {
    self.view = self.viewClass.new;
    self.view.backgroundColor = [UIColor whiteColor];
}



@end

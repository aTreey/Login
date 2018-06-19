//
//  LoginController.h
//  LoginOC
//
//  Created by liepin on 2018/3/22.
//  Copyright © 2018年 HongpengYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LoginItem;

@interface LoginController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray <NSArray <LoginItem*>*>*group;

@end